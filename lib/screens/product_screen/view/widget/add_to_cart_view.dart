/*
 *   Webkul Software.
 *   @package Mobikul Application Code.
 *   @Category Mobikul
 *   @author Webkul <support@webkul.com>
 *   @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *   @license https://store.webkul.com/license.html
 *   @link https://store.webkul.com/license.html
 */

import 'package:bagisto_app_demo/screens/product_screen/utils/index.dart';

class AddToCartView extends StatelessWidget {
  final List? downloadLinks;
  final List? groupedParams;
  final List? bundleParams;
  final List? configurableParams;
  final List? selectList;
  final List? selectParam;
  final dynamic configurableProductId;
  final String? price;
  final NewProducts? productData;
  final int? qty;
  final Map<String, dynamic>? bookingParams;
  const AddToCartView(
      {Key? key,
      this.productData,
      this.price,
      required this.configurableParams,
      required this.bundleParams,
      required this.selectList,
      required this.selectParam,
      required this.groupedParams,
      required this.downloadLinks,
      this.configurableProductId,
      required this.qty,
      this.bookingParams})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10,
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
          child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              elevation: AppSizes.spacingSmall,
              height: AppSizes.buttonHeight,
              minWidth: MediaQuery.of(context).size.width,
              color: Theme.of(context).colorScheme.background,
              textColor: Theme.of(context).colorScheme.onBackground,
              onPressed: () {
                ProductScreenBLoc productBloc =
                    context.read<ProductScreenBLoc>();
                productBloc
                    .add(OnClickProductLoaderEvent(isReqToShowLoader: true));
                _addToCart(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    StringConstants.addToCart.localized().toUpperCase(),
                    style: const TextStyle(
                        fontSize: AppSizes.spacingLarge, color: Colors.white),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  _addToCart(BuildContext context) {
    ProductScreenBLoc productScreenBLoc = context.read<ProductScreenBLoc>();
    List list = [];
    if (productData?.type == StringConstants.grouped) {
      if ((groupedParams ?? []).isNotEmpty) {
        list.add(groupedParams);
        productScreenBLoc.add(AddToCartProductEvent(
            qty ?? 1,
            productData?.id ?? "",
            downloadLinks ?? [],
            groupedParams ?? [],
            bundleParams ?? [],
            configurableParams ?? [],
            configurableProductId,
            "",
            bookingParams));
      } else {
        ShowMessage.showNotification(
            StringConstants.warning.localized(),
            StringConstants.atLeastOneWarning.localized(),
            Colors.yellow,
            const Icon(Icons.warning_amber));
        productScreenBLoc
            .add(OnClickProductLoaderEvent(isReqToShowLoader: false));

        return;
      }
    } else if (productData?.type == StringConstants.bundle) {
      productData?.bundleOptions?.forEach((element) {
        if ((bundleParams ?? []).isNotEmpty) {
          list.add(bundleParams);
          productScreenBLoc.add(AddToCartProductEvent(
              qty ?? 1,
              productData?.id ?? "",
              downloadLinks ?? [],
              groupedParams ?? [],
              bundleParams ?? [],
              configurableParams ?? [],
              configurableProductId,
              "",
              bookingParams));
        } else {
          ShowMessage.showNotification(
              StringConstants.warning.localized(),
              StringConstants.atLeastOneWarning.localized(),
              Colors.yellow,
              const Icon(Icons.warning_amber));

          productScreenBLoc
              .add(OnClickProductLoaderEvent(isReqToShowLoader: false));
          return;
        }
      });
    } else if (productData?.type == StringConstants.downloadable) {
      if ((downloadLinks ?? []).isNotEmpty) {
        productScreenBLoc.add(AddToCartProductEvent(
            qty ?? 1,
            productData?.id ?? "",
            downloadLinks ?? [],
            groupedParams ?? [],
            bundleParams ?? [],
            configurableParams ?? [],
            configurableProductId,
            "",
            bookingParams));
      } else {
        ShowMessage.showNotification(
            StringConstants.warning.localized(),
            StringConstants.linkRequired.localized(),
            Colors.yellow,
            const Icon(Icons.warning_amber));
        productScreenBLoc
            .add(OnClickProductLoaderEvent(isReqToShowLoader: false));

        return;
      }
    } else if (productData?.type == StringConstants.configurable) {

      String? id = getId(productData, configurableParams);

      if (configurableProductId == null) {
        ShowMessage.showNotification(
            StringConstants.warning.localized(),
            StringConstants.pleaseSelectVariants.localized(),
            Colors.yellow,
            const Icon(Icons.warning_amber));

        productScreenBLoc
            .add(OnClickProductLoaderEvent(isReqToShowLoader: false));
      } else {
        productScreenBLoc.add(AddToCartProductEvent(
            qty ?? 1,
            productData?.id ?? "",
            downloadLinks ?? [],
            groupedParams ?? [],
            bundleParams ?? [],
            configurableParams ?? [],
            id,
            "",
            bookingParams));
      }
    } else {
      productScreenBLoc.add(AddToCartProductEvent(
          qty ?? 1,
          productData?.id ?? "",
          downloadLinks ?? [],
          groupedParams ?? [],
          bundleParams ?? [],
          configurableParams ?? [],
          configurableProductId,
          "",
          bookingParams));
    }
  }

  String? getId(NewProducts? productData, List? configurableParams) {
    String? id = "0";
    if ((productData?.configurableData?.index ?? []).isNotEmpty) {
      id = productData?.configurableData?.index?[0].id;
    }

    for (var indexData = 0;
        indexData < (productData?.configurableData?.index?.length ?? 0);
        indexData++) {
      List map = [];

      Index? data = productData?.configurableData?.index?[indexData];

      for (int i = 0; i < (data?.attributeOptionIds?.length ?? 0); i++) {
        AttributeOptionIds? item = data?.attributeOptionIds?[i];
        for (int j = 0; j < (configurableParams?.length ?? 0); j++) {
          var param = configurableParams?[j];
          if (item?.attributeId.toString() ==
                  param?["attributeId"].toString() &&
              item?.attributeOptionId.toString() ==
                  param?["attributeOptionId"].toString()) {
            map.add(j);
            break;
          }
        }
      }

      if (map.length == configurableParams?.length) {
        return data?.id;
      }
    }
    return id;
  }
}
