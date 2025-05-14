import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../api.service';
import { AlertBannerComponent, AlertMessage } from '../alert-banner/alert-banner.component';

@Component({
  selector: 'app-settings',
  templateUrl: './settings.component.html',
  styleUrls: ['./settings.component.css'],
  standalone: true,
  imports: [CommonModule, FormsModule, AlertBannerComponent]
})
export class SettingsComponent implements OnInit {
  @ViewChild('editableDiv') editableDiv!: ElementRef<HTMLDivElement>;

  xsltBlock = 'MetadataXSLT';
  xsltContent = '';
  sampleData = '';
  profileIDs: string[] = [];
  selectedProfileID = '';
  selectedSection: 'edit-xslt' | 'test-xslt' | 'manage-data' = 'edit-xslt';
  testXsltBlock = 'MetadataXSLT';
  testBlockContent = '';
  showScrollTopButton = false;

  currentAlerts: AlertMessage[] = [];

  constructor(private apiService: ApiService) {}

  ngOnInit(): void {
    this.loadProfileIDs();
    this.loadXSLTContent();
    this.loadTestXSLTContent();
    window.addEventListener('scroll', this.checkScroll, true);
  }

  ngOnDestroy(): void {
    window.removeEventListener('scroll', this.checkScroll, true);
  }

  private checkScroll = (): void => {
    this.showScrollTopButton = window.pageYOffset > 200;
  };

  scrollToTop(): void {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  private formatError(operation: string, err: any): string {
    const status = err.status ? ` [${err.status}]` : '';
    const msg =
      err.error?.message ||
      err.message ||
      err.statusText ||
      JSON.stringify(err);
    return `${operation}${status}: ${msg}`;
  }

  onEditableInput(e: Event): void {
    this.xsltContent = (e.target as HTMLDivElement).innerText;
  }

  loadProfileIDs(): void {
    this.apiService.populateProfileIDs().subscribe({
      next: html => {
        const doc = new DOMParser().parseFromString(html, 'text/html');
        this.profileIDs = Array.from(doc.querySelectorAll('option')).map(o => o.value);
        if (this.profileIDs.length) {
          this.selectedProfileID = this.profileIDs[0];
        }
      },
      error: err => {
        console.error('populateProfileIDs error', err);
        this.showAlert(
          'error',
          this.formatError('Loading Profile IDs failed', err)
        );
      }
    });
  }
  
  loadXSLTContent(): void {
    this.apiService.getXSLTContent(this.xsltBlock).subscribe({
      next: xml => {
        this.xsltContent = xml;
        if (this.editableDiv) {
          this.editableDiv.nativeElement.innerText = xml;
        }
      },
      error: err => {
        console.error('getXSLTContent error', err);
        this.showAlert(
          'error',
          this.formatError(`Loading XSLT block "${this.xsltBlock}" failed`, err)
        );
      }
    });
  }
  
  loadTestXSLTContent(): void {
    this.apiService.getXSLTContent(this.testXsltBlock).subscribe({
      next: xml => {
        this.testBlockContent = xml;
      },
      error: err => {
        console.error('getXSLTContent (test) error', err);
        this.testBlockContent = 'Error loading XSLT.';
        this.showAlert(
          'error',
          this.formatError(`Loading test XSLT block "${this.testXsltBlock}" failed`, err)
        );
      }
    });
  }
  
  saveXPaths(): void {
    if (!confirm(`Overwrite XSLT for block "${this.xsltBlock}"? This cannot be undone.`)) {
      this.showAlert('warning', 'Save canceled by user.');
      return;
    }
  
    this.apiService.saveXSLTContent(this.xsltBlock, this.xsltContent).subscribe({
      next: () => {
        this.showAlert('success', `XSLT block "${this.xsltBlock}" saved successfully.`);
      },
      error: err => {
        console.error('saveXSLTContent error', err);
        this.showAlert(
          'error',
          this.formatError(`Saving XSLT block "${this.xsltBlock}" failed`, err)
        );
      }
    });
  }
  
  applyTestXSLT(): void {
    this.apiService.applyXSLT(this.sampleData, this.testXsltBlock).subscribe({
      next: out => {
        const outputEl = document.getElementById('transformedOutput');
        const isErrorOutput = /ERROR|invalid document structure|XSLT XML Transformer Error/i.test(out);
      
        if (outputEl) {
          outputEl.innerText = out;
        }
      
        if (isErrorOutput) {
          this.showAlert('error', `Applying XSLT "${this.testXsltBlock}" failed: See output.`);
        } else {
          this.showAlert('success', `XSLT "${this.testXsltBlock}" applied successfully.`);
        }
      },
      error: err => {
        console.error('applyXSLT error', err);
        const outputEl = document.getElementById('transformedOutput');
        if (outputEl) {
          outputEl.innerText = 'Error: Failed to load CCD or apply XSLT.';
        }
        this.showAlert(
          'error',
          this.formatError(`Applying test XSLT "${this.testXsltBlock}" failed`, err)
        );
      }
    });
  }
  
  deleteProfileData(): void {
    if (!this.selectedProfileID) {
      this.showAlert('warning', 'No Profile ID selected.');
      return;
    }
    if (!confirm(`Delete data for Profile ID "${this.selectedProfileID}"? This cannot be undone.`)) {
      this.showAlert('warning', 'Delete canceled by user.');
      return;
    }
  
    this.apiService.deleteDataByProfile(this.selectedProfileID).subscribe({
      next: () => {
        this.showAlert('success', `Data for Profile ID "${this.selectedProfileID}" deleted.`);
        this.loadProfileIDs();
      },
      error: err => {
        console.error('deleteDataByProfile error', err);
        this.showAlert(
          'error',
          this.formatError(`Deleting Profile ID "${this.selectedProfileID}" failed`, err)
        );
      }
    });
  }
  
  deleteAllData(): void {
    if (!confirm('Delete ALL data? This cannot be undone.')) {
      this.showAlert('warning', 'Bulk delete canceled by user.');
      return;
    }
  
    this.apiService.deleteAllData().subscribe({
      next: () => {
        this.showAlert('success', 'All data deleted successfully.');
        this.loadProfileIDs();
      },
      error: err => {
        console.error('deleteAllData error', err);
        this.showAlert(
          'error',
          this.formatError('Deleting all data failed', err)
        );
      }
    });
  }
  

  trackByIndex(i: number): number { return i; }

  showAlert(type: 'success' | 'warning' | 'error', message: string): void {
    const alert: AlertMessage = { type, message };
    this.currentAlerts = [...this.currentAlerts, alert];
    setTimeout(() => {
      this.currentAlerts = this.currentAlerts.filter(a => a !== alert);
    }, 10000);
  }

  removeAlert(i: number): void {
    this.currentAlerts.splice(i, 1);
  }

  chatGPTNotImplemented(): void {
    this.showAlert('warning', 'ChatGPT functionality not implemented yet.');
  }
}
