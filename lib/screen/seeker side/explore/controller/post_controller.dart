import 'package:flutter/cupertino.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/controller/image_provider.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/service/firebase.dart';
import 'package:job_studio/screen/seeker%20side/explore/model/post_image_model.dart';
import 'package:job_studio/screen/seeker%20side/explore/service/post_image_service.dart';
import 'package:provider/provider.dart';

class PostImageController with ChangeNotifier {
  FirebaseProvider storage = FirebaseProvider();
  final descriptionController = TextEditingController();
  Future postImage(context) async {
    final descriptions = descriptionController.text.trim();
    final providerFirebase =
        Provider.of<FirebaseProvider>(context, listen: false);
    final pickImageProvider =
        Provider.of<PickImageProvider>(context, listen: false);
    await providerFirebase.uploadToFirebase(
        pickImageProvider.galleryImage!.path,
        pickImageProvider.galleryImagePath!.path,
        "PostImage");
    final postModel = PostImageModel(
        image: Provider.of<FirebaseProvider>(context, listen: false).fileUrl!,
        description: descriptions);

    ImagepostService().postImage(postModel);
  }
}
