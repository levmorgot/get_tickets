import 'package:get_tickets/block/core/core_bloc.dart';
import 'package:get_tickets/block/filial/filial_event.dart';
import 'package:get_tickets/block/filial/filial_state.dart';
import 'package:get_tickets/models/filial.dart';
import 'package:get_tickets/services/filial/filial_repository.dart';

class FilialBloc extends CoreBloc<FilialEvent, FilialState> {
  final FilialsRepository filialsRepository;

  void firstLoading() async {
    emit(FilialLoadingState());
    try {
      final List<Filial> _loadedFilialList =
          await filialsRepository.getAllFilials();
      emit(FilialLoadedState(_loadedFilialList));
    } catch (_) {
      emit(FilialErrorState());
    }
  }

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
      try {
        final List<Filial> _loadedFilialList =
            await filialsRepository.searchFilials(event.searchString);
        if (_loadedFilialList.length > 0) {
          emit(FilialLoadedState(_loadedFilialList));
        } else {
          emit(FilialEmptyState());
        }
      } catch (_) {
        emit(FilialErrorState());
      }
    });
  }
}
