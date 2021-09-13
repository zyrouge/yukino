import 'package:extensions/extensions.dart' as extensions;
import 'package:flutter/material.dart';
import '../../plugins/helpers/ui.dart';
import '../../plugins/translator/translator.dart';

class SelectSourceWidget extends StatelessWidget {
  const SelectSourceWidget({
    required final this.sources,
    final Key? key,
    final this.selected,
  }) : super(key: key);

  final List<extensions.EpisodeSource> sources;
  final extensions.EpisodeSource? selected;

  @override
  Widget build(final BuildContext context) => Dialog(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: remToPx(0.8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: remToPx(1.1),
                ),
                child: Text(
                  Translator.t.selectSource(),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SizedBox(
                height: remToPx(0.3),
              ),
              ...sources
                  .map(
                    (final extensions.EpisodeSource x) => Material(
                      type: MaterialType.transparency,
                      child: RadioListTile<extensions.EpisodeSource>(
                        title: Text(
                          '${extensions.HttpUtils.domainFromURL(x.url)} (${x.quality.code})',
                        ),
                        value: x,
                        groupValue: selected,
                        activeColor: Theme.of(context).primaryColor,
                        onChanged: (final extensions.EpisodeSource? val) {
                          Navigator.of(context).pop(val);
                        },
                      ),
                    ),
                  )
                  .toList(),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: remToPx(0.7),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: remToPx(0.6),
                        vertical: remToPx(0.3),
                      ),
                      child: Text(
                        Translator.t.close(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
