import { Injectable } from '@angular/core';
import { SliderImage } from '../models/sliderImage';

@Injectable({
  providedIn: 'root'
})
export class SliderService {
  img1: SliderImage = { sliderImageId: 1, name: 'first.jfif', sliderText: 'march sales are now available' };
  img2: SliderImage = { sliderImageId: 2, name: 'second.jfif', sliderText: 'our belives' };
  img3: SliderImage = { sliderImageId: 3, name: 'third.jfif', sliderText: '50% discount on all products' };

  images: SliderImage[] = [this.img1, this.img2, this.img3]

  getAll(): SliderImage[] { return this.images };
  constructor() { }
}
