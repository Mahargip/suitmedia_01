import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suitmedia_01/components/primary_button.dart';
import 'package:suitmedia_01/components/text_field.dart';
import 'package:suitmedia_01/core/providers/user_provider.dart';
import 'package:suitmedia_01/core/routes/router.gr.dart';

@RoutePage()
class FirstPage extends ConsumerStatefulWidget {
  const FirstPage({super.key});

  @override
  ConsumerState createState() => _FirstPageState();
}

class _FirstPageState extends ConsumerState<FirstPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  void _checkPalindrome() {
    final text = _palindromeController.text.trim().toLowerCase().replaceAll(' ', '');

    if (text.isEmpty) return;

    final reversed = text.split('').reversed.join();
    final isPalindrome = text == reversed;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Result'),
        content: Text(isPalindrome ? 'isPalindrome' : 'not palindrome'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _goToSecondPage() {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    ref.read(userProvider.notifier).state = name;

    _palindromeController.clear();

    AutoRouter.of(context).push(const SecondRoute());
  }

  @override
  Widget build(BuildContext context) {
    final selectedUser = ref.watch(selectedUserProvider);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF2B637B), Color(0xFF75C7E3)],
                ),
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 58.r,
                            backgroundColor: const Color(0xffe0e6e6),
                            backgroundImage: selectedUser?.avatar != null
                                ? NetworkImage(selectedUser!.avatar)
                                : null,
                            child: selectedUser?.avatar == null
                                ? Icon(
                              Icons.person_add_alt_1,
                              size: 48.r,
                              color: Colors.white,
                            )
                                : null,
                          ),

                          SizedBox(height: 48.h),

                          MahaTextField(
                            controller: _nameController,
                            hintText: "Name",
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                            isExpand: false,
                            maxLines: 1,
                            isFilled: true,
                            fillColor: Colors.white,
                            borderColor: Colors.transparent,
                            focusedBorderColor: Colors.transparent,
                            cornerRadius: 12,
                            textCapitalization: TextCapitalization.words,
                          ),

                          SizedBox(height: 16.h),

                          MahaTextField(
                            controller: _palindromeController,
                            hintText: "Palindrome",
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                            isExpand: false,
                            maxLines: 1,
                            isFilled: true,
                            fillColor: Colors.white,
                            borderColor: Colors.transparent,
                            focusedBorderColor: Colors.transparent,
                            cornerRadius: 12,
                          ),

                          SizedBox(height: 45.h),

                          MahaPrimaryButton(
                            onPressed: _checkPalindrome,
                            backgroundColor: const Color.fromRGBO(43, 99, 123, 1),
                            width: MediaQuery.of(context).size.width,
                            height: 41.h,
                            child: const Text(
                              "CHECK",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          SizedBox(height: 16.h),

                          MahaPrimaryButton(
                            onPressed: _goToSecondPage,
                            backgroundColor: const Color.fromRGBO(43, 99, 123, 1),
                            width: MediaQuery.of(context).size.width,
                            height: 44.h,
                            child: const Text(
                              "NEXT",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
