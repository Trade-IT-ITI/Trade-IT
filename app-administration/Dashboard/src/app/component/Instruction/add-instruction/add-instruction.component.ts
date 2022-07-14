import { Component, OnInit } from '@angular/core';
import { InstructionService } from 'src/app/services/instruction.service';

@Component({
  selector: 'app-add-instruction',
  templateUrl: './add-instruction.component.html',
  styleUrls: ['./add-instruction.component.css']
})
export class AddInstructionComponent implements OnInit {

  instructionText:string="";
  constructor( private instructionService:InstructionService) { }
  
  addInstruction(){
    this.instructionService.addInstruction(this.instructionText).subscribe(data => {console.log(data)});
  }

  ngOnInit(): void {
  }

}
