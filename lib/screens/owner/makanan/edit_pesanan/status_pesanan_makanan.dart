import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kosan_euy/screens/owner/makanan/edit_pesanan/edit_status_pesanan_makanan.dart';

class StatusPesananMakananScreen extends StatelessWidget {
  const StatusPesananMakananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_StepStatus> steps = [
      _StepStatus('Pesanan Anda telah diterima', true),
      _StepStatus('Sedang menyiapkan pesanan Anda', true),
      _StepStatus('Pesanan Anda siap diantar', true),
      _StepStatus('Pesanan segera tiba!', true),
      _StepStatus('Pesanan telah diantar', false, isLast: true),
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF91B7DE),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Tombol back
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Card utama
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 48,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F2F2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/icon_makanan.png',
                                fit: BoxFit.contain,
                                errorBuilder:
                                    (context, error, stackTrace) => const Icon(
                                      Icons.fastfood,
                                      size: 36,
                                      color: Colors.grey,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Pemesanan Makanan Dan Minuman',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Pemesanan, Selasa 27 Desember',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Center(
                        child: Text(
                          '1 menit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'SEDANG DIANTAR',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      // Stepper status
                      Column(
                        children: List.generate(steps.length, (i) {
                          final step = steps[i];
                          return _StepperItem(
                            text: step.text,
                            isActive: step.isActive,
                            isLast: step.isLast,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 24,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const EditStatusPesananMakananScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF119DB0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepStatus {
  final String text;
  final bool isActive;
  final bool isLast;
  _StepStatus(this.text, this.isActive, {this.isLast = false});
}

class _StepperItem extends StatelessWidget {
  final String text;
  final bool isActive;
  final bool isLast;
  const _StepperItem({
    required this.text,
    required this.isActive,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 2),
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color:
                    isLast
                        ? Colors.orange
                        : (isActive ? Colors.orange : Colors.grey[300]),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 13),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 24,
                color: Colors.orange.withOpacity(0.5),
              ),
          ],
        ),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            text,
            style: TextStyle(
              color: isLast ? Colors.orange : Colors.grey[700],
              fontWeight: isLast ? FontWeight.w600 : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
