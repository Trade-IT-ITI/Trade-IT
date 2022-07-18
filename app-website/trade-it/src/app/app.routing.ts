import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";

import { AdminComponent } from "src/app/admin/admin.component";
import { HomeComponent } from "src/app/app-pages/home/home.component";
import { NotFoundComponent } from "src/app/app-pages/not-found/not-found.component";
import { SearchComponent } from "src/app/app-pages/search/search.component";
import { AddCategoryComponent } from 'src/app/admin/component/Category/add-category/add-category.component';
import { AddInstructionComponent } from 'src/app/admin/component/Instruction/add-instruction/add-instruction.component';
import { AddAreaComponent } from 'src/app/admin/component/Location/Area/add-area/add-area.component';
import { AddCityComponent } from 'src/app/admin/component/Location/City/add-city/add-city.component';
import { AddStatusComponent } from 'src/app/admin/component/Status/add-status/add-status.component';
import { AddSubcategoryComponent } from 'src/app/admin/component/Subcategory/add-subcategory/add-subcategory.component';
import { ProductDetailsComponent } from "src/app/app-pages/product-pages/product-details/product-details.component";
import { LoginComponent } from "src/app/app-pages/auth/login/login.component";
import { RegisterComponent } from "src/app/app-pages/auth/register/register.component";
import { ProfileComponent } from "src/app/app-pages/user-pages/profile/profile.component";

const routes: Routes = [
    { path: 'home', component: HomeComponent },
    { path: '', redirectTo: 'home', pathMatch: 'full' },
    { path: 'product/:id', component: ProductDetailsComponent },
    { path: 'search', component: SearchComponent },
    { path: 'login', component: LoginComponent },
    { path: 'register', component: RegisterComponent },
    { path: 'profile', component: ProfileComponent },
   // { path: 'admin', component: AdminComponent },
    
    {
        path: "admin", component: AdminComponent, children: [
            { path: "category/add", component: AddCategoryComponent },
            { path: "subcategory/add", component: AddSubcategoryComponent },
            { path: "city/add", component: AddCityComponent },
            { path: "area/add", component: AddAreaComponent },
            { path: "instruction/add", component: AddInstructionComponent },
            { path: "status/add", component: AddStatusComponent }
        ]
    },
    { path: 'not-found', component: NotFoundComponent },
    { path: '**', redirectTo: 'not-found' },
]
@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})
export class AppRoutingModule {

}