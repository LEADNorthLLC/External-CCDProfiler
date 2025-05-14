import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';

export type AlertType = 'success' | 'warning' | 'error';

export interface AlertMessage {
  type: AlertType;
  message: string;
}

@Component({
  selector: 'app-alert-banner',
  standalone: true,
  template: `
    <div class="alert-banner" [ngClass]="alert?.type">
      <span class="alert-text">{{ alert?.message }}</span>
      <button class="close-btn" (click)="close()">×</button>
    </div>
  `,
  styleUrls: ['./alert-banner.component.css'],
  imports: [CommonModule]
})
export class AlertBannerComponent {
  @Input() alert?: AlertMessage;
  @Output() dismiss = new EventEmitter<void>();

  close(): void {
    this.dismiss.emit();
  }
}
