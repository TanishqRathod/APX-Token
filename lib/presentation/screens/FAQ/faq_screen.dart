import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  List<bool> isExpandedList = [true, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("FAQ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.left_chevron,size: 30,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: isExpandedList.length,
        itemBuilder: (context, index) {
          String title = index == 0 ? "Get Involved" : "Community Engagement";
          String content = index == 0
              ? "Buy APX tokens, stake for rewards, or partner with APX."
              : "Details about community engagement go here.";

          return _buildExpandableTile(
            index: index,
            title: title,
            content: content,
          );
        },
      ),
    );
  }

  Widget _buildExpandableTile({
    required int index,
    required String title,
    required String content,
  }) {
    bool isOpen = isExpandedList[index];

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpandedList[index] = !isExpandedList[index];
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isOpen ? Color(0xff2A983D) : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                  Icon(
                    isOpen ? Icons.remove : Icons.add,
                    color: Colors.white,
                  ),
                ],
              ),
              if (isOpen) ...[
                const SizedBox(height: 10),
                Text(content,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
