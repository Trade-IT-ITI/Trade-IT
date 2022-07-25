import { Component, OnInit } from '@angular/core';
import { SliderImage } from 'src/app/models/sliderImage';
import { SliderService } from 'src/app/services/slider.service';

@Component({
  selector: 'app-slider',
  templateUrl: './slider.component.html',
  styleUrls: ['./slider.component.css']
})
export class SliderComponent implements OnInit {
  images: SliderImage[];
  pauseOnHover = true;
  pauseOnFocus = true;

  constructor(private sliderService: SliderService) {
    this.images = sliderService.getAll();
  }

  ngOnInit(): void {
  }

}
