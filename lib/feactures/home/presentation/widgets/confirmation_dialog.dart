import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String cancelText;
  final String confirmText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    this.cancelText = 'Cancelar',
    this.confirmText = 'Confirmar',
    required this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B7355),
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),


            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                size: 50,
                color: Color(0xFF4CAF50),
              ),
            ),

            const SizedBox(height: 24),


            Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C2C2C),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),


            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (onCancel != null) onCancel!();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFBDBDBD),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      cancelText,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B7355),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      confirmText,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}