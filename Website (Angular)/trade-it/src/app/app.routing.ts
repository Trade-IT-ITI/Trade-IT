import { ChangePasswordComponent } from './app-pages/user-pages/change-password/change-password.component';
import { categoryInstruction } from './models/categoryInstruction';
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
import { CategoryInstructionComponent } from 'src/app/admin/component/category-instruction/category-instruction.component';
import { AddSubcategoryComponent } from 'src/app/admin/component/Subcategory/add-subcategory/add-subcategory.component';
import { ProductDetailsComponent } from "src/app/app-pages/product-pages/product-details/product-details.component";
import { LoginComponent } from "src/app/app-pages/auth/login/login.component";
import { RegisterComponent } from "src/app/app-pages/auth/register/register.component";
import { ProfileComponent } from "src/app/app-pages/user-pages/profile/profile.component";
import { EditProfileComponent } from "src/app/app-pages/user-pages/edit-profile/edit-profile.component";
import { AddProductComponent } from "src/app/app-pages/product-pages/add-product/add-product.component";
import { AuthGuard } from './services/guards/auth-guard.service';
import { NotAuthGuard } from './services/guards/not-auth-guard.service';
import { AdminGuard } from './services/guards/admin-guard.service';
import { NotAccessibleComponent } from './app-pages/not-accessible/not-accessible.component';
import { UserFavoritesComponent } from 'src/app/app-pages/user-pages/user-favorites/user-favorites.component';

const routes: Routes = [
    { path: 'home', component: HomeComponent },
    { path: '', redirectTo: 'home', pathMatch: 'full' },
    { path: 'product/:id', component: ProductDetailsComponent },
    { path: 'addProduct', component: AddProductComponent, canActivate: [AuthGuard] },
    { path: 'search', component: SearchComponent },
    { path: 'login', component: LoginComponent, canActivate: [NotAuthGuard] },
    { path: 'register', component: RegisterComponent, canActivate: [NotAuthGuard]},
    { path: 'profile', component: ProfileComponent, canActivate: [AuthGuard] },
    { path: 'settings', component: EditProfileComponent, canActivate: [AuthGuard] },
    { path: 'favorites', component: UserFavoritesComponent, canActivate: [AuthGuard] },
    { path: 'changePassword', component: ChangePasswordComponent, canActivate: [AuthGuard] },


    {
        path: "admin", component: AdminComponent, canActivate: [AuthGuard, AdminGuard], children: [
            { path: "category/add", component: AddCategoryComponent },
            { path: "subcategory/add", component: AddSubcategoryComponent },
            { path: "city/add", component: AddCityComponent },
            { path: "area/add", component: AddAreaComponent },
            { path: "instruction/add", component: AddInstructionComponent },
            { path: "status/add", component: AddStatusComponent },
            { path: "categoryInstruction/add", component: CategoryInstructionComponent }
        ]
    },
    { path: 'not-accessible', component: NotAccessibleComponent },
    { path: 'not-found', component: NotFoundComponent },
    { path: '**', redirectTo: 'not-found' },
]
@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})
export class AppRoutingModule {

}