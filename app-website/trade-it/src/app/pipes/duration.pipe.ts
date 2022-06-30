import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'duration'
})
export class DurationPipe implements PipeTransform {

  transform(date: Date): string {
    let currentDate = new Date();

    let difference = (currentDate.getTime() - date.getTime()) / 1000 / 60 / 60 / 24 / 30 / 12;

    if (Math.floor(difference) > 0)
      return `${Math.floor(difference)} year ago`;

    if (Math.floor(difference *= 12) > 0)
      return `${Math.floor(difference)} month ago`;

    if (Math.floor(difference *= 30) > 0)
      return `${Math.floor(difference)} day ago`;

    if (Math.floor(difference *= 24) > 0)
      return `${Math.floor(difference)} hour ago`;

    if (Math.floor(difference *= 60) > 0)
      return `${Math.floor(difference)} minute ago`;

    return `now`;
  }
}
