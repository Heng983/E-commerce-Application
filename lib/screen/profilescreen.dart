import 'package:ecommerce_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      "https://i.pinimg.com/736x/eb/22/3c/eb223c5da71347bca6f6cb153ac0bbde.jpg"
                      ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ronald Richards",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "ronald.richards@example.com",
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        )
                      ],
                    )
                    ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 5, bottom: 10),
              child: Text(
                "Account",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      showDialog(
                        context: context, 
                        builder: (context) => AlertDialog(
                          title: Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          content: Text(
                            "This feature comming soon!",
                            style: TextStyle(
                              color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context), 
                              child: Text(
                                "Close",
                                style: TextStyle(
                                  color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                                ),
                              )
                              ),
                          ],
                        )
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.lock_outline),
                    title: Text(
                      "Change Password",
                      style: TextStyle(
                        color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      showDialog(
                        context: context, 
                        builder: (context) => AlertDialog(
                          title: Text(
                            "Change Password",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          content: Text(
                            "This feature comming soon!",
                            style: TextStyle(
                              color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "Close",
                                style: TextStyle(
                                  color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
              SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 5, bottom: 10),
              child: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.language_outlined),
                    title: Text(
                      "Language",
                      style: TextStyle(
                        color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      showDialog(
                        context: context, 
                        builder: (context) => AlertDialog(
                          title: Text(
                            "Language",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          content: Text(
                            "This feature comming soon!",
                            style: TextStyle(
                              color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context), 
                              child: Text(
                                "Close",
                                style: TextStyle(
                                  color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                                ),
                              )
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.dark_mode_outlined),
                    title: Text(
                      "Theme",
                      style: TextStyle(
                        color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: (){
                      showModalBottomSheet(
                        context: context, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (context) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.settings_applications_outlined),
                                title: Text("System Default"),
                                onTap: () {
                                  context.read<ThemeProvider>().changeToSystem(0);
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.light_mode_outlined),
                                title: Text("Light Theme"),
                                onTap: () {
                                  context.read<ThemeProvider>().changeToLight(1);
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.dark_mode_outlined),
                                title: Text("Dark Theme"),
                                onTap: () {
                                  context.read<ThemeProvider>().changeToDark(2);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          ),
                        );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications_none_outlined),
                    title: Text(
                      "Notifications",
                      style: TextStyle(
                        color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      showDialog(
                        context: context, 
                        builder: (context) => AlertDialog(
                          title: Text(
                            "Notifications",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          content: Text(
                            "This feature comming soon!",
                            style: TextStyle(
                              color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context), 
                              child: Text(
                                "Close",
                                style: TextStyle(
                                  color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                                ),
                              )
                              ),
                          ],
                        )
                        );
                    },
                  ),
              ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 5, bottom: 10),
              child: Text(
                "Support",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                  letterSpacing: 1.2,
                ),
              ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text(
                        "About Us",
                        style: TextStyle(
                          color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: (){
                        showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: Text(
                              "About Us",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            content: Text(
                              "This feature comming soon!",
                              style: TextStyle(
                                color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context), 
                                child: Text(
                                  "Close",
                                  style: TextStyle(
                                    color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                                  ),
                                )
                                ),
                            ],
                          )
                          );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.help_outline),
                      title: Text(
                        "Help Center",
                        style: TextStyle(
                          color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: (){
                        showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: Text(
                              "Help Center",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            content: Text(
                              "This feature comming soon!",
                              style: TextStyle(
                                color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context), 
                                child: Text(
                                  "Close",
                                  style: TextStyle(
                                    color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                                  ),
                                )
                                ),
                            ],
                          )
                          );
                      }
                    ),
                    ListTile(
                      leading: Icon(Icons.feedback_outlined),
                      title: Text(
                        "Send Feedback",
                        style: TextStyle(
                          color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: Text(
                              "Send Feedback",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                              ),
                              ),
                            content: Text(
                              "This feature comming soon!",
                              style: TextStyle(
                                color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context), 
                                child: Text(
                                  "Close",
                                  style: TextStyle(
                                    color: isDark ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onPrimary,
                                  ),
                                )
                                ),
                            ],
                          )
                          );
                      },
                    ),
                  ],
                ),  
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}