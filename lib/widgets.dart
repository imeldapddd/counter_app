import 'package:flutter/material.dart';

const Color biru = Color(0xff3498DB);
const Color abuAbu = Color(0xffC0C0C0);
const Color merah = Color(0xffE74C3C);

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.keyboardType,
  });

  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType? keyboardType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _sembunyi = true;

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: abuAbu, width: 2),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword && _sembunyi,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: const TextStyle(color: abuAbu),
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: const BorderSide(color: biru, width: 2),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _sembunyi ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () => setState(() => _sembunyi = !_sembunyi),
                )
              : null,
        ),
      ),
    );
  }
}

class TombolUtama extends StatelessWidget {
  const TombolUtama({
    super.key,
    required this.teks,
    required this.onPressed,
    this.loading = false,
  });

  final String teks;
  final VoidCallback onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: biru,
          disabledBackgroundColor: biru,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: loading ? null : onPressed,
        child: loading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Colors.white),
              )
            : Text(teks,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class PemisahAtau extends StatelessWidget {
  const PemisahAtau({super.key, required this.teks});

  final String teks;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: abuAbu, thickness: 2)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(teks,
              style: const TextStyle(color: abuAbu, fontSize: 12)),
        ),
        const Expanded(child: Divider(color: abuAbu, thickness: 2)),
      ],
    );
  }
}

// Hanya tampilan (tugas tidak meminta login Google)
class TombolGoogle extends StatelessWidget {
  const TombolGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: merah, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/icon/icon_google.png',
                  width: 28, height: 28),
            ),
            const Text('Google',
                style:
                    TextStyle(color: merah, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}