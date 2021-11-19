import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/filial/filial_event.dart';
import 'package:get_tickets/block/filial/filial_state.dart';
import 'package:get_tickets/models/filial.dart';
import 'package:get_tickets/services/filial/filial_repository.dart';

class FilialBloc extends Bloc<FilialEvent, FilialState> {
  final FilialsRepository filialsRepository;

  FilialBloc(this.filialsRepository) : super(FilialEmptyState()) {
    on<FilialLoadEvent>((event, emit) async {
      emit(FilialLoadingState());
      try {
        final List<Filial> _loadedFilialList =
            await filialsRepository.getAllFilials();
        emit(FilialLoadedState(_loadedFilialList));
      } catch (_) {
        emit(FilialErrorState());
      }
    });
    on<FilialSearchEvent>((event, emit) async {
      emit(FilialLoadingState());
      print("event.searchString");
      print(event.searchString);
      try {
        final List<Filial> _loadedFilialList =
            await filialsRepository.searchFilials(event.searchString);
        emit(FilialLoadedState(_loadedFilialList));
      } catch (_) {
        emit(FilialErrorState());
      }
    });
  }
}
