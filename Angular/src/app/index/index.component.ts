import {
  Component,
  OnInit
} from '@angular/core';
import {
  ApiService
} from '../api.service';
import {
  finalize
} from 'rxjs/operators';
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
import { response } from 'express';

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css'],
  imports: [CommonModule, FormsModule, AlertBannerComponent],
})
export class IndexComponent implements OnInit {
  responseMessage = '';
  reportsHtml: string = '';
  importType: string = 'bulk';
  directoryPath: string = '';
  fileInput: FileList | null = null;
  numDocuments: number = 0;
  filterDocuments: string = '';
  profileID: string = '';
  importResult: string = '';
  loading: boolean = false;
  selectedProfileID: string = '';
  openMenu: string | null = null;
  loadingCoverage = true;
  sectionsMapping: {
     key: string;display: string
  } [] = [{
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
        key: 'encompassingEncounter',
        display: 'Encompassing Encounter'
     },
     {
        key: 'encounters',
        display: 'Encounters'
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
        key: 'patient',
        display: 'Patient'
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


  coverageStats: any[] = [];

  constructor(private api: ApiService) {}

  ngOnInit(): void {
     this.loadReports();
     this.loadCoverageStatsAuto();

     this.sectionsMapping.forEach(section => {
        this.importSelectedSections[section.key] = true;
     });
  }

  showImportSettingsModal = false;
  tempImportSelectedSections: {
     [key: string]: boolean
  } = {};
  importSelectedSections: {
     [key: string]: boolean
  } = {}; 

  openImportSettings(event: MouseEvent): void {
     event.stopPropagation();
     this.showImportSettingsModal = true;

     this.sectionsMapping.forEach(section => {
        if (this.importSelectedSections[section.key] === undefined) {
           this.importSelectedSections[section.key] = true;
        }
        this.tempImportSelectedSections[section.key] = this.importSelectedSections[section.key];
     });
  }

  closeImportSettings(): void {
     this.showImportSettingsModal = false;
  }

  applyImportSettings(): void {
     this.importSelectedSections = {
        ...this.tempImportSelectedSections
     };
     this.showImportSettingsModal = false;
  }

  toggleImportSelectAll(): void {
     const shouldSelectAll = !this.areAllImportSectionsSelected();
     this.sectionsMapping.forEach(section => {
        this.tempImportSelectedSections[section.key] = shouldSelectAll;
     });
  }

  areAllImportSectionsSelected(): boolean {
     return this.sectionsMapping.every(section => this.tempImportSelectedSections[section.key]);
  }

  deleteProfileData(profileID: string): void {
   if (!confirm(`Delete all data for Profile ID "${profileID}"? This cannot be undone.`)) return;
 
   this.api.deleteDataByProfile(profileID).subscribe({
     next: res => {
       if (this.isHtmlResponse(res)) {
         console.error('HTML received deleting profile', res);
         this.showAlert(
           'error',
           'INVALID RESPONSE: deleteProfileData returned HTML. Check your session/API.'
         );
         return;
       }
       this.coverageStats = this.coverageStats.filter(p => p.ProfileID !== profileID);
       this.showAlert('success', `Profile "${profileID}" deleted successfully.`);
     },
     error: err => {
       console.error('deleteDataByProfile error', err);
       this.showAlert(
         'error',
         this.formatError(`Deleting profile "${profileID}" failed`, err)
       );
     }
   });
 }
 
 
 renameProfile(oldID: string): void {
  const newID = prompt(`Rename profile "${oldID}" to:`)?.trim();
  if (!newID || newID === oldID) return;
  
  if (!/^[a-zA-Z0-9]+$/.test(newID)) {
    this.showAlert('warning', 'New profile name must be alphanumeric (letters and numbers only).');
    return;
  }
  
 
   this.api.renameProfile(oldID, newID).subscribe({
     next: res => {
       if (this.isHtmlResponse(res)) {
         console.error('HTML received renaming profile', res);
         this.showAlert(
           'error',
           'INVALID RESPONSE: renameProfile returned HTML. Check your session/API.'
         );
         return;
       }
       const profile = this.coverageStats.find(p => p.ProfileID === oldID);
       if (profile) profile.ProfileID = newID;
       this.showAlert('success', `Profile renamed to "${newID}".`);
     },
     error: err => {
       console.error('renameProfile error', err);
       this.showAlert(
         'error',
         this.formatError(`Renaming profile "${oldID}" failed`, err)
       );
     }
   });
 }
 
 

  toggleMenu(profileID: string): void {
     this.openMenu = this.openMenu === profileID ? null : profileID;
  }
  exportReport(profileID: string): void {
   this.api.generateExcelReport(profileID, false, '').subscribe({
     next: response => {
       if (this.isHtmlResponse(response)) {
         console.error('HTML received exporting report', response);
         this.showAlert(
           'error',
           'INVALID RESPONSE: exportReport returned HTML. Check your session/API.'
         );
         return;
       }
       const blob = new Blob([response], { type: 'application/vnd.ms-excel;charset=utf-8;' });
       const link = document.createElement('a');
       link.href = URL.createObjectURL(blob);
       link.download = `Report_${profileID}.xls`;
       document.body.appendChild(link);
       link.click();
       setTimeout(() => {
         document.body.removeChild(link);
         URL.revokeObjectURL(link.href);
       }, 100);
       this.showAlert('success', 'Report exported successfully.');
     },
     error: err => {
       console.error('generateExcelReport error', err);
       this.showAlert(
         'error',
         this.formatError(`Exporting report "${profileID}" failed`, err)
       );
     }
   });
 }
 
 

 loadCoverageStatsAuto(): void {
   this.loadingCoverage = true;
   this.api.getSectionCoverage().subscribe({
     next: data => {
       this.loadingCoverage = false;
       this.coverageStats = data;
     },
     error: err => {
       console.error('getSectionCoverage error', err);
       this.loadingCoverage = false;
       this.showAlert(
         'error',
         this.formatError('Fetching coverage stats failed', err)
       );
       this.coverageStats = [];
     }
   });
 }
 

  callHello(): void {
     console.log('Hello from IndexComponent!');
     this.api.getHello().subscribe({
        next: (res: string) => {
           console.log('Response from API:', res);
           this.responseMessage = res;
        },
        error: (err) => {
           console.error('Error calling API:', err);
        }
     });
  }

  loadReports(): void {
   this.api.getDistinctProfileIDs().subscribe({
     next: data => {
       if (this.isHtmlResponse(data)) {
         console.error('Unexpected HTML loading reports', data);
         this.showAlert(
           'error',
           'INVALID RESPONSE: loadReports returned HTML. Check your session/API endpoint.'
         );
         return;
       }
       this.reportsHtml = data;
     },
     error: err => {
       console.error('getDistinctProfileIDs error', err);
       this.showAlert(
         'error',
         this.formatError('Loading reports failed', err)
       );
     }
   });
 }
 
 
private isHtmlResponse(response: string): boolean {
   if (!response) return false;
   const t = response.trim().toLowerCase();
   return t.startsWith('<!doctype html') || t.startsWith('<html');
 }
 
 private formatError(op: string, err: any): string {
   const status = err.status ? ` [${err.status}]` : '';
   const msg = err.error?.message || err.message || err.statusText || JSON.stringify(err);
   return `${op}${status}: ${msg}`;
 }
 
 
 
 
  updateImportType(event: Event): void {
     const target = event.target as HTMLSelectElement;
     this.importType = target.value;
  }

  onDirectorySelect(event: Event): void {
    const target = event.target as HTMLInputElement;
    if (target.files && target.files.length > 0) {
      this.fileInput = target.files;
  
      let totalSize = 0;
      for (let i = 0; i < target.files.length; i++) {
        totalSize += target.files[i].size;
      }
  
      const maxSize = 500 * 1024 * 1024; // 100 MB
      if (totalSize > maxSize) {
        const confirmed = confirm("Warning: The total size of the selected files exceeds 500 MB. This may take a long time and use significant resources. Continue?");
        if (!confirmed) {
          this.fileInput = null;
          return;
        }
      }
  
      const firstFilePath = target.files[0].webkitRelativePath;
      this.directoryPath = firstFilePath.substring(0, firstFilePath.lastIndexOf('/'));
    }
  }
  

  async startImport(): Promise<void> {
   if (!this.profileID || !/^[a-zA-Z0-9]+$/.test(this.profileID)) {
     this.showAlert('warning', 'Profile name is required and must be alphanumeric.');
     return;
   }
 
   const importData: any = {
     profileID: this.profileID,
     importType: this.importType,
     selectedSections: Object
       .keys(this.importSelectedSections)
       .filter(k => this.importSelectedSections[k])
       .join(',')
   };
   if (this.importType === 'bulk') {
     if (!this.directoryPath) {
       this.showAlert('warning', 'Please enter a directory path for bulk import.');
       return;
     }
     importData.directoryPath = this.directoryPath.replace(/^"(.*)"$/, '$1');
   } else if (this.importType === 'api') {
     if (!this.fileInput?.length) {
       this.showAlert('warning', 'Please select one or more files.');
       return;
     }
     importData.files = Array.from(this.fileInput).map(f => f.name);
   } else {
     if (this.numDocuments <= 0) {
       this.showAlert('warning', 'You must enter a valid number of documents.');
       return;
     }
     if (this.numDocuments > 500) {
      const confirmed = confirm("Warning: You are about to import more than 500 CCD documents. This operation may take a long time and use significant resources. Do you wish to continue?");
      if (!confirmed) return;
    }  
     importData.numDocuments = this.numDocuments;
     importData.filterDocuments = this.filterDocuments;
   }
 
   this.loading = true;
   this.progressMessage = '';
 
   try {
     const response = await fetch(
       '/csp/LeadNorth/api/dataImporter/processImport',
       {
         method: 'POST',
         headers: { 'Content-Type': 'application/json' },
         body: JSON.stringify(importData)
       }
     );
 
     if (!response.ok) {
       throw new Error(`Server responded with ${response.status} ${response.statusText}`);
     }
 
     const clone = response.clone();
     const bodyText = await clone.text();
     if (this.isHtmlResponse(bodyText)) {
       console.error('HTML received instead of stream payload', bodyText);
       this.showAlert(
         'error',
         'INVALID RESPONSE: startImport returned HTML. Check server health and authentication.'
       );
       return;
     }
 
     const reader = response.body!.getReader();
     const decoder = new TextDecoder();
     let buffer = '';
     let importSucceeded = false;
 
     while (true) {
       const { done, value } = await reader.read();
       if (done) break;
       buffer += decoder.decode(value, { stream: true });
       const lines = buffer.split('\n');
       buffer = lines.pop()!;
 
       for (const line of lines) {
         if (line.startsWith('PROGRESS:')) {
           this.progressMessage = line.replace('PROGRESS:', '').trim();
         } else if (line.trim()) {
           console.log('Import output:', line);
         }
       }
       importSucceeded = true;
     }
 
     if (!importSucceeded) {
       throw new Error('No progress or data received during import.');
     }
 
     this.showAlert('success', 'Import completed successfully.');
     this.loadReports();
     this.loadCoverageStatsAuto();

   }
   catch (err: any) {
     console.error('Error during import:', err);
     this.showAlert(
       'error',
       `Import failed: ${err.message || err}`
     );
   }
   finally {
     this.loading = false;
     setTimeout(() => this.progressMessage = '', 3000);
   }
 }
 

  progressMessage: string = '';

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