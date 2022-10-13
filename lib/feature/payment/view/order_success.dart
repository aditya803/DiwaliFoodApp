import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:mvc_bolierplate_getx/feature/model/order_model.dart';

class OrderSuccess extends StatefulWidget {
  final OrderData order;
  const OrderSuccess({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderSuccess> createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess>
    with TickerProviderStateMixin {
  late FlutterGifController controller1;
  @override
  void initState() {
    controller1 = FlutterGifController(vsync: this);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller1.repeat(
        min: 0,
        max: 53,
        period: const Duration(milliseconds: 1500),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GifImage(
                controller: controller1,
                image: const AssetImage("asset/image-2.gif")),
            Text(
              'Order ID: ${widget.order.orderDataId}',
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'YOUR OTP : ${widget.order.otp}',
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            //  const Spacer(),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  'Please Pay ₹ ${widget.order.finalPrice} at Counter to confirm your order',
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
