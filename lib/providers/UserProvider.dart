import 'package:flutter_training/commons.dart';

class UserProvider extends ChangeNotifier {
  final UserProfil _user = UserProfil(
    id: 1,
    name: 'John Doe',
    drones: [
      Drone(
        id: 1,
        name: 'Drone 1',
        model: 'Model 1',
        description: 'Description 1',
        status: 'Status 1',
        battery: 'Battery 1',
        checkList: CheckList(
          id: 1,
          title: 'My Checklist 1',
          categories: [
            CategoryCL(
              name: 'Category A',
              backgroundColor: Colors.white38,
              items: [
                ItemCL(id: 101, description: 'Item 1'),
                ItemCL(id: 102, description: 'Item 2'),
              ],
            ),
            CategoryCL(
              name: 'Category B',
              backgroundColor: Colors.white30,
              items: [
                ItemCL(id: 201, description: 'Item 3'),
                ItemCL(id: 202, description: 'Item 4'),
              ],
            ),
            CategoryCL(
              name: 'Category C',
              backgroundColor: Colors.white24,
              items: [
                ItemCL(id: 301, description: 'Item 5'),
                ItemCL(id: 302, description: 'Item 6'),
              ],
            ),
          ],
        ),
      ),
      Drone(
        id: 2,
        name: 'Drone 2',
        model: 'Model 2',
        description: 'Description 2',
        status: 'Status 2',
        battery: 'Battery 2',
        checkList: CheckList(
          id: 2,
          title: 'My Checklist 2',
          categories: [
            CategoryCL(
              name: 'Category A',
              backgroundColor: Colors.white38,
              items: [
                ItemCL(id: 101, description: 'Item 1'),
                ItemCL(id: 102, description: 'Item 2'),
              ],
            ),
            CategoryCL(
              name: 'Category B',
              backgroundColor: Colors.white30,
              items: [
                ItemCL(id: 201, description: 'Item 3'),
                ItemCL(id: 202, description: 'Item 4'),
              ],
            ),
            CategoryCL(
              name: 'Category C',
              backgroundColor: Colors.white24,
              items: [
                ItemCL(id: 301, description: 'Item 5'),
                ItemCL(id: 302, description: 'Item 6'),
              ],
            ),
          ],
        ),
      ),
    ],
    vols: [],
  );

  UserProfil getUser() => _user;

  List<Drone> getDrones() => _user.drones;


  void addVol(Vol vol) {
    _user.vols.add(vol);
    notifyListeners();
  }

  void removeVol(Vol vol) {
    _user.vols.remove(vol);
    notifyListeners();
  }

  void addDrone(Drone drone) {
    _user.drones.add(drone);
    notifyListeners();
  }

  void removeDrone(Drone drone) {
    _user.drones.remove(drone);
    notifyListeners();
  }

  void updateDrone(Drone drone) {
    final index = _user.drones.indexWhere((element) => element.id == drone.id);
    _user.drones[index] = drone;
    notifyListeners();
  }




}
