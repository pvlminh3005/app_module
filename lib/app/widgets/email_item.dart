import 'package:app_module/app/cores/value/app_color.dart';
import 'package:app_module/app/cores/value/dimen.dart';
import 'package:app_module/app/cores/value/font_size.dart';
import 'package:app_module/app/data/model/email_model.dart';
import 'package:app_module/app/widgets/custom_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'base/custom_text.dart';

enum EmailType {
  Stack,
  Slidable,
}

class EmailItem extends StatelessWidget {
  final EmailModel? email;
  final EmailType type;

  const EmailItem({
    this.email,
    this.type = EmailType.Slidable,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: type == EmailType.Slidable
          ? ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (ctx) {},
                  backgroundColor: Colors.black54,
                  foregroundColor: Colors.white,
                  icon: Icons.save,
                  label: 'Save',
                ),
                SlidableAction(
                  onPressed: (ctx) {},
                  backgroundColor: kErrorColor,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            )
          : null,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        padding: EdgeInsets.all(AppDimen.spacing_1 + 2),
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimen.radiusBig),
        ),
        child: Row(
          children: [
            _buildImage(),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNameAndTime(),
                  _buildContent(),
                  _buildTextNotification(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildImage() {
    return Container(
      width: 90.0,
      height: 90.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppDimen.radiusBig,
        ),
        border: Border.all(
          color: kColorGrey,
          width: 4,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
        child: CachedNetworkImage(
          imageUrl: email!.avatar!,
          fit: BoxFit.cover,
          errorWidget: (ctx, value, _) => Center(
            child: Icon(
              Icons.error,
              color: kErrorColor,
            ),
          ),
          placeholder: (ctx, _) => CustomLoading(color: kPrimaryColor),
        ),
      ),
    );
  }

  Widget _buildNameAndTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          email!.name!,
          fontWeight: FontWeight.w700,
          fontSize: FontSize.BIG + 1,
          maxLines: 1,
        ),
        CustomText(
          email!.date!,
          color: kTextColorLight,
        ),
      ],
    );
  }

  Widget _buildContent() {
    return CustomText(
      email!.content!,
      fontWeight: FontWeight.w600,
      maxLines: 1,
      margin: EdgeInsets.symmetric(vertical: AppDimen.spacing_1 - 3),
    );
  }

  Widget _buildTextNotification() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          'You have a mail. Check it!',
          fontSize: FontSize.MEDIUM - 1,
          maxLines: 1,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
