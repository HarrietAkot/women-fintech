import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jebajeba_beta/custom/route_transitions.dart';
import 'package:jebajeba_beta/models/order.dart';
import 'package:jebajeba_beta/theme/colors.dart';
import 'package:jebajeba_beta/utils/formatter.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/toast_service.dart';


final DateFormat dateFormatter = DateFormat('yMMMd');
final DateFormat timeFormatter = DateFormat('kk:mm');

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  bool loading = false;
  // TODO: replace dummy data with live API data
  List<Order> orders = [
    Order(
      id: 0,
      status: "completed",
      currency: "$currency",
      total: 4000,
      parentId: 3,
      customerId: 300,
      pricesIncludeTax: true,
      dateCreated: DateTime.now().add(Duration(days: -30)),
      dateModified: DateTime.now().add(Duration(days: -25)),
      orderKey: "orderKey",
      paymentMethod: "card",
      paymentMethodTitle: "Visa",
      billing: CustomerDetails(
          firstName: "Erick",
          lastName: "Ogaro",
          address1: "1234 st",
          address2: "1345 st",
          company: "N/A",
          city: "KAMPALA",
          state: "N/A",
          postcode: "N/A",
          country: "Uganda",
          phone: "+256792835893"),
      shipping: CustomerDetails(
        firstName: "Erick",
        lastName: "Ogaro",
        address1: "1234 st",
        address2: "1345 st",
        company: "N/A",
        city: "KAMPALA",
        state: "N/A",
        postcode: "N/A",
        country: "Uganda",
        phone: "+256792835893",
      ),
      createdVia: "Mobile App",
      customerNote: "customerNote",
      cartHash: "",
      number: "34",
      lineItems: [
        OrderLineItem(
          id: 0,
          name: "Face Cream",
          productId: 23,
          quantity: 2,
          subtotal: 200,
          total: 200,
          price: 100,
        ),
        OrderLineItem(
          id: 1,
          name: "Hair Cream",
          productId: 2,
          quantity: 3,
          subtotal: 300,
          total: 300,
          price: 100,
        ),
        OrderLineItem(
          id: 2,
          name: "Face Wash",
          productId: 2,
          quantity: 3,
          subtotal: 300,
          total: 300,
          price: 100,
        ),
      ],
    ),
    Order(
      id: 2,
      status: "cancelled",
      currency: "$currency",
      total: 4000,
      parentId: 3,
      customerId: 300,
      pricesIncludeTax: true,
      dateCreated: DateTime.now().add(Duration(days: -30)),
      dateModified: DateTime.now().add(Duration(days: -25)),
      orderKey: "orderKey",
      paymentMethod: "mobile",
      paymentMethodTitle: "Apple Pay",
      billing: CustomerDetails(
          firstName: "Erick",
          lastName: "Ogaro",
          address1: "1234 st",
          address2: "1345 st",
          company: "N/A",
          city: "KAMPALA",
          state: "N/A",
          postcode: "N/A",
          country: "Uganda",
          phone: "+256792835893"),
      shipping: CustomerDetails(
        firstName: "Erick",
        lastName: "Ogaro",
        address1: "1234 st",
        address2: "1345 st",
        company: "N/A",
        city: "KAMPALA",
        state: "N/A",
        postcode: "N/A",
        country: "Uganda",
        phone: "+256792835893",
      ),
      createdVia: "Mobile App",
      customerNote: "customerNote",
      cartHash: "",
      number: "35",
      lineItems: [
        OrderLineItem(
          id: 0,
          name: "Face Cream",
          productId: 23,
          quantity: 2,
          subtotal: 200,
          total: 200,
          price: 100,
        ),
        OrderLineItem(
          id: 1,
          name: "Hair Cream",
          productId: 2,
          quantity: 3,
          subtotal: 300,
          total: 300,
          price: 100,
        ),
        OrderLineItem(
          id: 2,
          name: "Face Wash",
          productId: 2,
          quantity: 3,
          subtotal: 300,
          total: 300,
          price: 100,
        ),
      ],
    ),
    Order(
      id: 0,
      status: "completed",
      currency: "$currency",
      total: 4000,
      parentId: 3,
      customerId: 300,
      pricesIncludeTax: true,
      dateCreated: DateTime.now().add(Duration(days: -30)),
      dateModified: DateTime.now().add(Duration(days: -25)),
      orderKey: "orderKey",
      paymentMethod: "paypal",
      paymentMethodTitle: "PayPal",
      billing: CustomerDetails(
          firstName: "Erick",
          lastName: "Ogaro",
          address1: "1234 st",
          address2: "1345 st",
          company: "N/A",
          city: "KAMPALA",
          state: "N/A",
          postcode: "N/A",
          country: "Uganda",
          phone: "+256792835893"),
      shipping: CustomerDetails(
        firstName: "Erick",
        lastName: "Ogaro",
        address1: "1234 st",
        address2: "1345 st",
        company: "N/A",
        city: "KAMPALA",
        state: "N/A",
        postcode: "N/A",
        country: "Uganda",
        phone: "+256792835893",
      ),
      createdVia: "Mobile App",
      customerNote: "customerNote",
      cartHash: "",
      number: "36",
      lineItems: [
        OrderLineItem(
          id: 0,
          name: "Face Cream",
          productId: 23,
          quantity: 2,
          subtotal: 200,
          total: 200,
          price: 100,
        ),
        OrderLineItem(
          id: 1,
          name: "Hair Cream",
          productId: 2,
          quantity: 3,
          subtotal: 300,
          total: 300,
          price: 100,
        ),
        OrderLineItem(
          id: 2,
          name: "Face Wash",
          productId: 2,
          quantity: 3,
          subtotal: 300,
          total: 300,
          price: 100,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Order History"),
          actions: [
            IconButton(
              // TODO: refresh
              onPressed: () => null,
              icon: const Icon(
                CarbonIcons.renew,
              ),
            )
          ],
        ),
        body: loading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                        ),
                      ),
                    ),
                    Text(
                      "Please wait...",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              )
            : !loading && orders.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "No orders available. Please make your first order then refresh.",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      // TODO: refresh
                      // getOrderHistory();
                    },
                    child: SingleChildScrollView(
                      child: FixedTimeline.tileBuilder(
                        theme: TimelineThemeData(
                          color: kBrandMain,
                          indicatorTheme: const IndicatorThemeData(
                            color: kBrandAccent,
                            size: 10.0,
                          ),
                          indicatorPosition: 0.5,
                          nodePosition: 0.1,
                        ),
                        builder: TimelineTileBuilder.connectedFromStyle(
                          contentsAlign: ContentsAlign.basic,
                          oppositeContentsBuilder: (context, index) {
                            Order order = orders[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                order.status == "cancelled"
                                    ? CarbonIcons.close
                                    : order.status == "completed"
                                        ? CarbonIcons.checkmark
                                        : CarbonIcons.time,
                                // size: 15.0,
                                color: order.status == "cancelled"
                                    ? Colors.red.shade900
                                    : order.status == "completed"
                                        ? kSuccessGreen
                                        : Colors.orange[800],
                                size: 18.0,
                              ),
                            );
                          },
                          contentsBuilder: (context, index) {
                            Order order = orders[index];
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    dateFormatter.format(order.dateCreated),
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${order.currency} ${order.total}",
                                        style: const TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        order.status.toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () => Navigator.push(
                                    context,
                                    ScaleRoute(
                                      page: OrderDetails(
                                        order: order,
                                      ),
                                    ),
                                  ),
                                  trailing: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 40.0,
                                      width: 40.0,
                                      child: Image.asset(
                                        order.paymentMethod.toLowerCase() ==
                                                "card"
                                            ? "assets/images/visa.png"
                                            : order.paymentMethod == "paypal"
                                                ? "assets/images/paypal.png"
                                                : order.paymentMethod ==
                                                        "mobile"
                                                    ? "assets/images/mobile.png"
                                                    : "assets/images/master.png",
                                        fit: BoxFit.fitWidth,
                                        height: 30.0,
                                        width: 30.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          },
                          connectorStyleBuilder: (context, index) =>
                              ConnectorStyle.dashedLine,
                          indicatorStyleBuilder: (context, index) =>
                              IndicatorStyle.outlined,
                          itemCount: orders.length,
                          // itemCount: 30,
                        ),
                      ),
                    ),
                  ));
  }
}

class OrderDetails extends StatelessWidget {
  final Order order;
  const OrderDetails({Key? key, required this.order}) : super(key: key);

  // filter out delivery date from metadata
  String _deliveryDate() {
    try {
      String date = '';
      for (var i = 0; i < order.metadata!.length; i++) {
        var metadata = order.metadata![i];

        if (metadata.key.toLowerCase() == "ywcdd_order_delivery_date") {
          date = metadata.value;
        }
      }
      return date;
    } catch (e) {
      return order.dateCreated.toString();
    }
  }

  // filter out delivery time  from slot from metadata
  String _deliveryTimeFrom() {
    try {
      String timeFrom = '';
      for (var i = 0; i < order.metadata!.length; i++) {
        var metadata = order.metadata![i];

        if (metadata.key.toLowerCase() == "ywcdd_order_slot_from") {
          timeFrom = metadata.value;
        }
      }
      return timeFrom;
    } catch (e) {
      return "${order.dateCreated.hour}:${order.dateCreated.minute}";
    }
  }

  // filter out delivery time to slot from metadata
  String _deliveryTimeTo() {
    try {
      String timeTo = '';
      for (var i = 0; i < order.metadata!.length; i++) {
        var metadata = order.metadata![i];

        if (metadata.key.toLowerCase() == "ywcdd_order_slot_to") {
          timeTo = metadata.value;
        }
      }
      return timeTo;
    } catch (e) {
      return "${order.dateCreated.hour}:${order.dateCreated.minute}";
    }
  }

  List<Widget> _buildTransactionLineItems() {
    List<Widget> lineItemTiles = [];

    for (int i = 0; i < order.lineItems.length; i++) {
      OrderLineItem lineItem = order.lineItems[i];

      num price = lineItem.price;

      lineItemTiles.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                lineItem.name,
                style: const TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
                // textAlign: TextAlign.center,
                maxLines: 3,
              ),
              subtitle: Text(
                "$currency ${price.toStringAsFixed(2)} x${lineItem.quantity}\nTOTAL: $currency ${lineItem.total} ",
                style: const TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.6,
                ),
                // textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
            const Divider(),
          ],
        ),
      );
    }

    return lineItemTiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                Text(
                  "Order # - ${order.number}",
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: Icon(
                            CarbonIcons.document,
                            size: 20.0,
                            color: order.status == "cancelled"
                                ? Colors.red.shade700
                                : order.status == "completed"
                                    ? kBrandMain
                                    : Colors.orange[800],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dateFormatter.format(order.dateCreated),
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${order.currency} ${order.total}",
                            style: const TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            order.paymentMethodTitle,
                            style: const TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            order.status.toUpperCase(),
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600,
                              color: order.status == "cancelled"
                                  ? Colors.red.shade700
                                  : order.status == "completed"
                                      ? kBrandMain
                                      : Colors.orange[800],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Text(
                              "Delivery Date\n${_deliveryDate()}\nFrom ${_deliveryTimeFrom()} to ${_deliveryTimeTo()}",
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: Image.asset(
                            order.paymentMethod.toLowerCase() == "card"
                                ? "assets/images/visa.png"
                                : order.paymentMethod == "paypal"
                                    ? "assets/images/paypal.png"
                                    : order.paymentMethod == "mobile"
                                        ? "assets/images/mobile.png"
                                        : "assets/images/master.png",
                            fit: BoxFit.fitWidth,
                            height: 30.0,
                            width: 30.0,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 2.0,
                              bottom: 2.0,
                            ),
                            child: Text(
                              "Billing",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ),
                          Text(
                            "${order.billing.firstName} ${order.billing.lastName}\n${order.billing.phone}\n${order.billing.email ?? "No email available."}\n${order.billing.address1} ${order.billing.address2}\n${order.billing.city}\n${order.billing.country}",
                            style: const TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 30.0,
                        width: 30.0,
                        child: Icon(
                          CarbonIcons.location,
                          size: 16.0,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 2.0,
                            bottom: 2.0,
                          ),
                          child: Text(
                            "Shipping",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          "${order.shipping.firstName} ${order.shipping.lastName}\n${order.shipping.phone}\n${order.shipping.email ?? "No email available."}\n${order.shipping.address1} ${order.shipping.address2}\n${order.shipping.city}\n${order.shipping.country}",
                          style: const TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: Icon(
                            CarbonIcons.document,
                            size: 16.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 2.0,
                          bottom: 2.0,
                        ),
                        child: Text(
                          "Order Items",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                ..._buildTransactionLineItems(),
              ],
            ),
          ),
          Container(
              height: order.status.toUpperCase() == "PENDING" ? 60.0 : 0,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                30.0,
                10.0,
                30.0,
                10.0,
              ),
              margin: const EdgeInsets.fromLTRB(
                20.0,
                10.0,
                20.0,
                10.0,
              ),
              child: order.status.toUpperCase() == "PENDING"
                  ? InkWell(
                      onTap: () async {
                        await canLaunchUrl(
                          Uri(scheme: "https", host: "jebajebaug.com"),
                        )
                            ? await launchUrl(
                                Uri(scheme: "https", host: "jebajebaug.com"),
                              )
                            : ToastNotificationService.showErrorNotification(
                                "Unable to launch the checkout url.");
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.07,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        decoration: const BoxDecoration(
                          color: kBrandMain,
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "COMPLETE PAYMENT",
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600,
                              color: kBrandLight,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container()),
        ],
      ),
    );
  }
}
