import '../models/AddProductToCartModel.dart';
import '../models/AddressModel.dart';
import '../models/CartModel.dart';
import '../models/CategoryModel.dart';
import '../models/FavModel.dart';
import '../models/FavModelByUserID.dart';
import '../models/ProductModel.dart';
import '../models/productdetailsmodel.dart';

List<ProductModelJson> ProductList = <ProductModelJson>[];

List<ProductModelJson> ProductCategoryList = <ProductModelJson>[];

List<CategoryModel> CategoryList = <CategoryModel>[];

int? CategoryId;

CategoryModel? categoryModel;

Productdetailsmodel? productdetailsmodel;

FavModel? favModel;

int? userId,productId;

String? productImage,productDiscount,productCost,producCount,productName;

bool? is_Cart;

bool is_Active = false;

List<FavModel>FAvList=<FavModel>[];

var MyColor;

int? productid;

// String? detailsimage;
String? detailsimage,detailsname,detailsdescription;
int? productdetalsid,detailsdiscount,detailscount,detailscost;

List<FavModelByUserId>FavModelByUserIdList=<FavModelByUserId>[];

AddProductToCartModel? addProductToCartModel;

CartModel? cartModel;

List<CartModel>CartModelByUserIdList=<CartModel>[];

AddressModel? addressModel;

List<AddressModel>AddressModelByUserIdList=<AddressModel>[];



