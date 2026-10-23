import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/presentation/auth/services/event_service.dart';
import 'package:evently_app/presentation/home/tabs/home_tap/home_provider/home_tab_provider.dart';
import 'package:evently_app/presentation/home/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavTab extends StatefulWidget {
  const FavTab({super.key});

  @override
  State<FavTab> createState() => _FavTabState();
}

class _FavTabState extends State<FavTab> {
  String searchText = '';
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EventsProvider>(context, listen: false).getEventFav();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    EventsProvider provider = Provider.of<EventsProvider>(context);

    if (provider.isLoadingFav) {
      return Center(child: CircularProgressIndicator());
    }
    if (provider.errorMessageFav != null) {
      return Center(child: Text(provider.errorMessageFav.toString()));
    }
    List<EventModel> events = provider.eventsFav
        .where(
          (event) => event.title.toLowerCase().contains(
            searchText.trim().toLowerCase(),
          ),
        )
        .toList();
    return SafeArea(
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardAppearance: Brightness.dark,
              keyboardType: TextInputType.text,

              onChanged: (value) {
                searchText = value;
                setState(() {});
              },
              style: TextStyle(
                color: Theme.of(context).hoverColor,
                fontSize: 16,
                fontWeight: .w700,
              ),
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search_outlined,
                  size: 25,
                  color: Theme.of(context).shadowColor,
                ),
                filled: true,
                fillColor: Theme.of(context).splashColor,
                hint: Text(
                  l10n.searchForEvent,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).hoverColor,
                  ),
                ),

                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return Provider.of<EventsProvider>(
                  context,
                  listen: false,
                ).getEventFav();
              },
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) =>
                    EventCard(eventModel: events[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
