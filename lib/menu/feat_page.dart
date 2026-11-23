import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/feat_controller.dart';

class FeatPage extends StatelessWidget {
  FeatPage({super.key});

  final FeatController controller = Get.put(FeatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("English Premier League"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchTeams,
            tooltip: 'Segarkan',
          ),
        ],
      ),
      body: Obx(
        () {
        
          if (controller.isLoading.value) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.indigo),
                  SizedBox(height: 16),
                  Text(
                    'Memuat data tim Premier League...',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

        
          if (controller.errorMessage.value.isNotEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.cloud_off_rounded,
                      size: 64,
                      color: Colors.redAccent,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Gagal Mengambil Data',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      controller.errorMessage.value,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: controller.fetchTeams,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Coba Lagi'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          // 3. Jika daftar kosong
          if (controller.teamList.isEmpty) {
            return const Center(
              child: Text("Tidak ada data tim yang ditemukan."),
            );
          }

          // 4. Daftar Klub dengan ListView.builder
          return RefreshIndicator(
            onRefresh: controller.fetchTeams,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              itemCount: controller.teamList.length,
              itemBuilder: (context, index) {
                final team = controller.teamList[index];

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        // Logo Klub (strBadge)
                        Container(
                          width: 65,
                          height: 65,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: team.strBadge.isNotEmpty
                              ? Image.network(
                                  team.strBadge,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                    Icons.sports_soccer,
                                    size: 32,
                                    color: Colors.grey,
                                  ),
                                )
                              : const Icon(
                                  Icons.sports_soccer,
                                  size: 32,
                                  color: Colors.grey,
                                ),
                        ),
                        const SizedBox(width: 14),

                        // Nama Klub (strTeam) & Nama Stadion (strStadium)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                team.strTeam,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.stadium_outlined,
                                    size: 16,
                                    color: Colors.indigo,
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      team.strStadium.isNotEmpty
                                          ? team.strStadium
                                          : 'Stadion tidak tersedia',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey[700],
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
