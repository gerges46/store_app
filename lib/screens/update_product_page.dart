import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/update_product.dart';
import 'package:storeapp/widgets/custom_btn.dart';
import 'package:storeapp/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? description, productName, image;

  String? price;

  bool isLoading = false;
  late  ProductModel product;
  @override
  Widget build(BuildContext context) {
     product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0 * 2),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextFormField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hint: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  onChanged: (data) {
                    description = data;
                  },
                  hint: 'description',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.number,
                  hint: 'Price',
                  onChanged: (data) {
                    price = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hint: 'image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(
                  height: 10 * 5,
                ),
                CustomButton(
                  onTap: () async{
                    isLoading = true;
                    setState(() {});
                    try {
                    await  updateProduct();
                        ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('success')));
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())),snackBarAnimationStyle: AnimationStyle(duration: Duration(seconds: 4)));
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  text: 'Update',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

 Future<ProductModel> updateProduct() async{

return await UpdateProductService().updateProduct(
      title: productName==null?product.title:productName!,
      price: price==null?product.price.toString():price!,
      description: description==null?product.description:description!,
      image: image==null?product.image:image!,
      id: product.id,
    );
  
 } 
}
