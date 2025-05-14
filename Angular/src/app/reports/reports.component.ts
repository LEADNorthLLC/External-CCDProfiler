import {
  Component,
  OnInit,
  AfterViewInit,
  OnDestroy
} from '@angular/core'; 
import {
  DomSanitizer,
  SafeHtml
} from '@angular/platform-browser';
import {
  ActivatedRoute
} from '@angular/router';
import {
  ApiService
} from '../api.service';
import {
  CommonModule
} from '@angular/common';
import {
  FormsModule
} from '@angular/forms';
import {
   AlertBannerComponent,
   AlertMessage
 } from '../alert-banner/alert-banner.component';

@Component({
  selector: 'app-reports',
  templateUrl: './reports.component.html',
  styleUrls: ['./reports.component.css'],
  standalone: true,
  imports: [CommonModule, FormsModule, AlertBannerComponent]
})
export class ReportsComponent implements OnInit, AfterViewInit, OnDestroy {
  profileIDs: string[] = [];
  selectedProfileID: string = '';
  reportSections: {
     [key: string]: SafeHtml
  } = {};
  sectionVisibility: {
     [key: string]: boolean
  } = {};

  sectionsMapping: {
     key: string;display: string
  } [] = [
     {
         key: 'patient',
         display: 'Patient'
     },
     {
        key: 'encompassingEncounter',
        display: 'Encompassing Encounter'
     },
     {
        key: 'encounters',
        display: 'Encounters'
     },
     {
      key: 'allSections',
      display: 'Metadata'
     },
     {
      key: 'advanceDirective',
      display: 'Advance Directive'
     },
     {
        key: 'allergy',
        display: 'Allergy'
     },
     {
        key: 'diagnosis',
        display: 'Diagnosis'
     },
     {
        key: 'familyHistory',
        display: 'Family History'
     },
     {
        key: 'functionalStatus',
        display: 'Functional Status'
     },
     {
        key: 'goals',
        display: 'Goals'
     },
     {
        key: 'implants',
        display: 'Implants'
     },
     {
        key: 'immunizations',
        display: 'Immunizations'
     },
     {
        key: 'medications',
        display: 'Medications'
     },
     {
        key: 'payer',
        display: 'Payer'
     },
     {
        key: 'planOfCare',
        display: 'Plan Of Care'
     },
     {
        key: 'problems',
        display: 'Problems'
     },
     {
        key: 'procedures',
        display: 'Procedures'
     },
     {
        key: 'results',
        display: 'Results'
     },
     {
        key: 'socialHistory',
        display: 'Social History'
     },
     {
        key: 'vitalSigns',
        display: 'Vital Signs'
     }
  ];


  private collapsibleEventHandler!: (event: MouseEvent) => void;


  ngOnInit(): void {
     this.route.queryParams.subscribe(params => {
        this.selectedProfileID = params['profileID'] || '';
        if (this.selectedProfileID) {
           this.loadReportData();
        }
     });
     this.loadProfileIDs();
  }

  ngAfterViewInit(): void {
     this.collapsibleEventHandler = this.onDocumentClick.bind(this);
     document.addEventListener('click', this.collapsibleEventHandler);
  }

  ngOnDestroy(): void {
     document.removeEventListener('click', this.collapsibleEventHandler);
  }

  onDocumentClick(event: MouseEvent): void {
     const target = event.target as HTMLElement;
     if (target && target.classList.contains('collapsible')) {
        const content = target.nextElementSibling as HTMLElement;
        if (content.classList.contains('content-section-data')) {
           const isAlreadyActive = target.classList.contains('active');
           target.classList.toggle('active', !isAlreadyActive);
           content.style.display = isAlreadyActive ? 'none' : 'block';
        }
     }
  }

  showSettingsModal = false;
  deIdentify = false;
  selectedSections: {
     [key: string]: boolean
  } = {};

  tempDeIdentify = false;
  tempSelectedSections: {
     [key: string]: boolean
  } = {};

  constructor(
     private apiService: ApiService,
     private sanitizer: DomSanitizer,
     private route: ActivatedRoute
  ) {
     this.sectionsMapping.forEach(item => {
        this.sectionVisibility[item.key] = false;

        this.selectedSections[item.key] = true;
     });
  }

  openSettingsModal(event: MouseEvent): void {
     event.stopPropagation();
     this.showSettingsModal = true;

     this.tempDeIdentify = this.deIdentify;
     this.tempSelectedSections = {
        ...this.selectedSections
     };
  }

  applySettings(): void {
     this.deIdentify = this.tempDeIdentify;
     this.selectedSections = {
        ...this.tempSelectedSections
     };
     this.showSettingsModal = false;
  }

  closeSettingsModal(): void {
     this.showSettingsModal = false;
  }
  selectAllSections(): void {
     Object.keys(this.tempSelectedSections).forEach(key => {
        this.tempSelectedSections[key] = true;
     });
  }

  unselectAllSections(): void {
     Object.keys(this.tempSelectedSections).forEach(key => {
        this.tempSelectedSections[key] = false;
     });
  }
  toggleSelectAll(): void {
     const allSelected = this.areAllSectionsSelected();
     Object.keys(this.tempSelectedSections).forEach(key => {
        this.tempSelectedSections[key] = !allSelected;
     });
  }

  areAllSectionsSelected(): boolean {
     return Object.values(this.tempSelectedSections).every(value => value === true);
  }


  isHtmlResponse(response: string): boolean {
   if (!response) return false;
   const trimmed = response.trim().toLowerCase();
   return trimmed.startsWith('<!doctype html') || trimmed.startsWith('<html');
 }
 loadProfileIDs(): void {
   this.apiService.getDistinctReportProfileIDs().subscribe({
     next: (response: string) => {
       if (this.isHtmlResponse(response)) {
         this.showAlert('error', 'Could not connect to server while loading report profiles.');
         console.error('Unexpected HTML response while loading profile IDs.');
         return;
       }
       const parser = new DOMParser();
       const doc = parser.parseFromString(response, 'text/html');
       const options = doc.querySelectorAll('option');
       this.profileIDs = Array.from(options).map(option => option.value);
       if (this.profileIDs.length > 0 && !this.selectedProfileID) {
         this.selectedProfileID = this.profileIDs[0];
         this.loadReportData();
       }
     },
     error: (err) => {
       console.error('Error loading profile IDs:', err);
       this.showAlert('error', 'Failed to load available profiles.');
     }
   });
 }
 
 

 loadReportData(): void {
   if (!this.selectedProfileID) {
     this.showAlert('warning', 'No profile selected for loading report data.');
     return;
   }
 
   this.sectionsMapping.forEach(item => {
     this.apiService.getQS(item.key, this.selectedProfileID).subscribe({
       next: (response: string) => {
         if (this.isHtmlResponse(response)) {
           this.showAlert('error', `Could not connect to server while loading section "${item.display}".`);
           console.error(`Unexpected HTML response while loading section: ${item.key}`);
           return;
         }
 
         let cleanedResponse = response
           .replace(/onclick="[^"]*"/g, '')
           .replace(/style="display:\s*none;?"/gi, '');

         if (item.key === 'allSections') {
            cleanedResponse = cleanedResponse.replace(/, /g, '<br>');
         }
          
 
         this.reportSections[item.key] = this.sanitizer.bypassSecurityTrustHtml(cleanedResponse);
 
         setTimeout(() => {
           const allButtons = document.querySelectorAll('button.collapsible');
 
           allButtons.forEach(button => {
             const realButton = button as HTMLElement;
             const fieldName = realButton.innerText.trim();
             const tableDiv = realButton.nextElementSibling as HTMLElement;
             if (!tableDiv) return;
 
             const table = tableDiv.querySelector('table');
             if (!table) return;
 
             let totalOccurrences = 0;
             const rows = table.querySelectorAll('tbody tr');
 
             rows.forEach((row, index) => {
               if (index === 0) return;
               const cells = row.querySelectorAll('td');
               if (cells.length >= 2) {
                 const value = (cells[0]?.textContent || '').trim();
                 const occurrencesStr = (cells[1]?.textContent || '').trim();
                 const occurrences = parseInt(occurrencesStr, 10);
 
                 if (value !== '' && !isNaN(occurrences)) {
                   totalOccurrences += occurrences;
                 }
               }
             });
 
             realButton.innerText = `${fieldName.split('-')[0].trim()} - Occurrences(${totalOccurrences})`;
 
             if (totalOccurrences === 0) {
               realButton.style.backgroundColor = '#aba5a5';
               realButton.style.color = 'white';
               realButton.style.cursor = 'not-allowed';
             }
           });
 
           this.checkEmptyTables();
         }, 0);
       },
       error: (err) => {
         console.error(`Error loading section "${item.display}":`, err);
         this.showAlert('error', `Failed to load section: ${item.display}`);
       }
     });
   });
 }
 
 

  checkEmptyTables(): void {
     const reportSections = document.querySelectorAll('.content');

     reportSections.forEach(sectionContainer => {
        const parentButton = sectionContainer.previousElementSibling as HTMLElement;
        if (!parentButton || !parentButton.classList.contains('report-button')) return;

        const childFieldButtons = sectionContainer.querySelectorAll('button.collapsible');

        let allFieldsGray = true;
        childFieldButtons.forEach(fieldButton => {
           const buttonElement = fieldButton as HTMLElement;
           const fieldStyle = window.getComputedStyle(buttonElement);

           if (fieldStyle.backgroundColor !== 'rgb(171, 165, 165)' && fieldStyle.backgroundColor !== '#aba5a5') {
              allFieldsGray = false;
           }
        });

        if (allFieldsGray) {
         parentButton.style.backgroundColor = '#aba5a5';
         parentButton.style.color = 'white';
         parentButton.style.cursor = 'not-allowed';
       } else {
         parentButton.style.backgroundColor = '';
         parentButton.style.color = '';
         parentButton.style.cursor = '';
       }
       
     });
  }


  markButtonAsEmpty(button: HTMLElement): void {
   button.classList.add('disabled');
 }

  toggleSection(sectionKey: string): void {
     this.sectionVisibility[sectionKey] = !this.sectionVisibility[sectionKey];
  }

  exportReport(): void {
   if (!this.selectedProfileID) {
     this.showAlert('warning', 'No profile selected for export.');
     return;
   }
 
   const selectedSectionKeys = Object.keys(this.selectedSections).filter(key => this.selectedSections[key]);
   const sectionsString = selectedSectionKeys.join(',');
 
   this.apiService.generateExcelReport(this.selectedProfileID, this.deIdentify, sectionsString)
     .subscribe({
       next: (response: string) => {
         if (this.isHtmlResponse(response)) {
           this.showAlert('error', 'Could not connect to server while exporting report.');
           console.error('Unexpected HTML response while exporting report.');
           return;
         }
         const blob = new Blob([response], { type: 'application/vnd.ms-excel;charset=utf-8;' });
         const link = document.createElement('a');
         link.href = window.URL.createObjectURL(blob);
         link.download = `Report_${this.selectedProfileID}.xls`;
 
         document.body.appendChild(link);
         link.click();
         setTimeout(() => {
           document.body.removeChild(link);
           window.URL.revokeObjectURL(link.href);
         }, 100);
 
         this.showAlert('success', 'Report exported successfully.');
       },
       error: (err) => {
         console.error('Error exporting report:', err);
         this.showAlert('error', 'Failed to export report.');
       }
     });
 }
 
  currentAlerts: AlertMessage[] = [];
  trackByIndex(index: number, alert: AlertMessage): number {
    return index;
  }
  showAlert(type: 'success' | 'warning' | 'error', message: string): void {
    const newAlert: AlertMessage = { type, message };
    this.currentAlerts = [...this.currentAlerts, newAlert];
    setTimeout(() => {
      this.currentAlerts = this.currentAlerts.filter(a => a !== newAlert);
    }, 10000);
  }
  removeAlert(index: number): void {
    if (index > -1) {
      this.currentAlerts.splice(index, 1);
    }
  }

}