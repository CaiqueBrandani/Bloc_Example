import 'package:aplicativo_bloc/pages/bloc/home_event.dart';
import 'package:aplicativo_bloc/pages/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc(HomeState initialState) : super(HomeErrorState(message: 'Erro ao carregar os dados!')) {
    on<HomeEvent>((event, emit) {});
  }

  Stream<HomeState?> mapEventToState(HomeEvent event) async* {
    HomeState? state;
    switch (event.runtimeType) {
      case HomeFetchList:
        state = await _fetchList();
        break;
      case HomeFetchListWithError:
        state = await _fetchListWithError();
        break;
      case HomeFetchWithEmptyList:
        state = await _fetchWithEmptyList();
        break;
    }
    yield state;
  }

  Future<HomeState> _fetchList() async {
    var list = await Future.delayed(
      const Duration(
        seconds: 3, 
      ),
      () => <String> [
        'Item 1',
        'Item 2',
        'Item 3',
        'Item 4',
        'Item 5',
        'Item 6',
        'Item 7',
        'Item 8',
        'Item 9',
        'Item 10',
      ],
    );
    return HomeStateLoaded(list: list);
  }

  Future<HomeState> _fetchWithEmptyList() async {
    return await Future.delayed(
      const Duration(
        seconds: 3, 
      ),
      () => HomeStateEmptyList(),
    );
  }

  Future<HomeState?> _fetchListWithError() async {
    return await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => HomeErrorState(message: 'Não foi possível carregar os dados!')
    );
  }
}