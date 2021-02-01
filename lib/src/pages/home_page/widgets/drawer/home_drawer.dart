import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../services/firebase_services/auth_service.dart';
import 'home_drawer_menu.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User>();
    final _scrollController = ScrollController();

    return Drawer(
      child: Container(
        color: const Color(0xff34495E),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                margin: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  color: Color(0xff2E4060),
                ),
                accountName:
                    _firebaseUser != null && _firebaseUser.displayName != null
                        ? Text(_firebaseUser.displayName,
                            style: const TextStyle(fontSize: 22))
                        : const Text(''),
                accountEmail:
                    _firebaseUser != null && _firebaseUser.email != null
                        ? Text(_firebaseUser.email)
                        : const Text(''),
                currentAccountPicture:
                    _firebaseUser != null && _firebaseUser.photoURL != null
                        ? CachedNetworkImage(
                            imageUrl: _firebaseUser.photoURL,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/profile/avatar-anonym.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          )
                        : const CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/profile/avatar-anonym.png'),
                          ),
                otherAccountsPictures: [
                  IconButton(
                    icon: const Icon(Icons.power_settings_new),
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<AuthService>().signOut();
                    },
                  )
                ],
              ),
              const HomeDrawerMenu()
            ],
          ),
        ),
      ),
    );
  }
}
