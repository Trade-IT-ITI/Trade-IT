import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { NoopAnimationsModule } from '@angular/platform-browser/animations';
import { FormsModule } from '@angular/forms';
import { NgxSliderModule } from '@angular-slider/ngx-slider';

import { AppComponent } from 'src/app/app.component';
import { NavbarComponent } from 'src/app/app-layout/navbar/navbar.component';
import { NavbarCategoriesComponent } from './app-layout/navbar-categories/navbar-categories.component';
import { HomeComponent } from 'src/app/app-pages/home/home.component';
import { SliderComponent } from 'src/app/app-pages/slider/slider.component';
import { ProductsComponent } from 'src/app/app-pages/product-pages/products/products.component';
import { DurationPipe } from 'src/app/pipes/duration.pipe';
import { FooterComponent } from 'src/app/app-layout/footer/footer.component';
import { PagesNavComponent } from 'src/app/app-layout/pages-nav/pages-nav.component';
import { SearchComponent } from 'src/app/app-pages/search/search.component';
import { AppRoutingModule } from 'src/app/app.routing';
import { NotFoundComponent } from 'src/app/app-pages/not-found/not-found.component';
import { AdminModule } from 'src/app/admin/admin.module';
import { ProductDetailsComponent } from 'src/app/app-pages/product-pages/product-details/product-details.component';
import { LoginComponent } from 'src/app/app-pages/auth/login/login.component';
import { RegisterComponent } from 'src/app/app-pages/auth/register/register.component';
import { AddProductComponent } from 'src/app/app-pages/product-pages/add-product/add-product.component';
import { ProfileComponent } from 'src/app/app-pages/user-pages/profile/profile.component';
import { EditProfileComponent } from './app-pages/user-pages/edit-profile/edit-profile.component';
import { LoaderComponent } from './app-layout/loader/loader.component';
import { NotAccessibleComponent } from './app-pages/not-accessible/not-accessible.component';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    NavbarCategoriesComponent,
    HomeComponent,
    SliderComponent,
    ProductsComponent,
    DurationPipe,
    FooterComponent,
    PagesNavComponent,
    SearchComponent,
    NotFoundComponent,
    ProductDetailsComponent,
    LoginComponent,
    RegisterComponent,
    AddProductComponent,
    ProfileComponent,
    EditProfileComponent,
    LoaderComponent,
    NotAccessibleComponent,
  ],
  imports: [
    BrowserModule,
    NoopAnimationsModule,
    HttpClientModule,
    FormsModule,
    NgxSliderModule,
    AppRoutingModule,
    AdminModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
