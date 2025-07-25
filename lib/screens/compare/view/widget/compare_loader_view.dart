/*
 *   Webkul Software.
 *   @package Mobikul Application Code.
 *   @Category Mobikul
 *   @author Webkul <support@webkul.com>
 *   @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *   @license https://store.webkul.com/license.html
 *   @link https://store.webkul.com/license.html
 */

import 'package:bagisto_app_demo/screens/compare/utils/index.dart';

class CompareLoaderView extends StatelessWidget {
  const CompareLoaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SkeletonLoader(
              highlightColor: Theme.of(context).highlightColor,
              baseColor: Theme.of(context).scaffoldBackgroundColor,
              direction: SkeletonDirection.ttb,
              builder: SizedBox(
                height: MediaQuery.of(context).size.height / 2.1,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.only(right: 1),
                          decoration: const BoxDecoration(
                              border: Border(
                            right: BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            ),
                          )),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            color: Colors.red,
                          ));
                    }),
              )),
          SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.grey,
              )),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 0, bottom: 2),
                child: Text(
                  StringConstants.sku.localized().toUpperCase(),
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SkeletonLoader(
            highlightColor: Theme.of(context).highlightColor,
            baseColor: Theme.of(context).scaffoldBackgroundColor,
            builder: SizedBox(
              height: 33,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(right: 1),
                      width: MediaQuery.of(context).size.width / 2.2,
                      decoration: const BoxDecoration(
                          border: Border(
                        right: BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      )),
                      child: Container(
                        color: Colors.red,
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border.all(
                color: Colors.grey,
              )),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 6, bottom: 2),
                child: Text(
                  StringConstants.description.localized(),
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SkeletonLoader(
            highlightColor: Theme.of(context).highlightColor,
            baseColor: Theme.of(context).scaffoldBackgroundColor,
            builder: SizedBox(
              height: MediaQuery.of(context).size.height / 2 + 60,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(right: 1),
                      width: MediaQuery.of(context).size.width / 2.2,
                      decoration: const BoxDecoration(
                          border: Border(
                        right: BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      )),
                      child: Container(
                        color: Colors.red,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
