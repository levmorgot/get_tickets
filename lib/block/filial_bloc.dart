import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/filial_event.dart';
import 'package:get_tickets/block/filial_state.dart';
import 'package:get_tickets/models/filial.dart';
import 'package:get_tickets/services/filial_repository.dart';

class FilialBloc extends Bloc<FilialEvent, FilialState> {
  final FilialsRepository filialsRepository;

  FilialBloc(this.filialsRepository) : super(FilialEmptyState()) {
    on<FilialLoadEvent>((event, emit) async {
      emit(FilialLoadingState());
      try {
        final List<Filial> _loadedFilailList =
            await filialsRepository.getAllFilials();
        emit(FilialLoadedState(_loadedFilailList));
      } catch (_) {
        emit(FilialErrorState());
      }
    });
  }
}
