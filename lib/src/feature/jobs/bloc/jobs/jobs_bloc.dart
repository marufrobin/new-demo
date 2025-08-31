import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../model/my_live_orders.model.dart';
import '../../data/repository/jobs.repository.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobsRepository jobsRepository;

  JobsBloc(this.jobsRepository) : super(JobsInitial()) {
    on<JobsFetchEvent>(_onFetch);
  }

  Future<void> _onFetch(JobsFetchEvent event, Emitter<JobsState> emit) async {
    try {
      emit(JobsLoading());

      final jobs = await jobsRepository.getJobs();

      emit(JobsLoaded(jobs: jobs));
    } catch (e) {
      emit(JobsError(error: e.toString()));
    }
  }
}
