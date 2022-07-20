import { HttpParams } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { category } from 'src/app/models/category';
import { categoryInstruction } from 'src/app/models/categoryInstruction';
import { CategoryService } from 'src/app/admin/services/category.service';
import { InstructionService } from 'src/app/admin/services/instruction.service';
import { instruction } from 'src/app/models/instruction';
import { CategoryInstructionService } from '../../services/category-instruction.service';
@Component({
  selector: 'app-category-instruction',
  templateUrl: './category-instruction.component.html',
  styleUrls: ['./category-instruction.component.css']
})
export class CategoryInstructionComponent implements OnInit {
  categories: category[] = [];
  allInstructions: instruction[] = [];
  notUsedInstructions: instruction[] = [];
  instructionId: number = 0
  categoryId: number = 0
  isInstructionDisabled: boolean = true
  constructor(private router: Router, private categoryInstructionService: CategoryInstructionService, private categoryService: CategoryService, private instructionService: InstructionService) { }

  ngOnInit(): void {
    let CategoryParams: HttpParams = new HttpParams();
    CategoryParams = CategoryParams.append('expand', 'CategoryInstructions');
    this.categoryService.getAllCategory(CategoryParams).subscribe(data => {
      this.categories = data;
      console.log(data)
    })
    this.instructionService.getAllInstruction().subscribe((data) => {
      this.allInstructions = data;
    })
  }
  onSelectCategory() {
    this.notUsedInstructions = [];
    if (this.categoryId == 0) {
      this.isInstructionDisabled = true;

    }
    else {
      let category = this.categories.find(c => c.categoryId == this.categoryId);
      if (category) {
        this.isInstructionDisabled = false
        for (let i = 0; i < this.allInstructions.length; i++) {
          let instruction = category!.categoryInstructions!.find(is => is.instructionId == this.allInstructions[i].instructionId);
          if (!instruction) {
            this.notUsedInstructions.push(this.allInstructions[i])
          }
        }
      }
    }
  }
  addCatInstruction() {
    if(this.categoryId !=0 &&this.instructionId !=0){
      this.categoryInstructionService.addCategoryInstruction(this.categoryId, this.instructionId).subscribe((d) => {
        let catInst :categoryInstruction={categoryId:this.categoryId, instructionId:this.instructionId} 
        this.categories.find(c => c.categoryId == this.categoryId)?.categoryInstructions?.push(catInst);
        this.categoryId = 0
        this.instructionId = 0
        this.notUsedInstructions = [];
        
      })
    }
  }
}
