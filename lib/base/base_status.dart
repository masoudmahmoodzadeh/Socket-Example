abstract class BaseStatus {}

class InitialStatus extends BaseStatus {}

class LoadingStatus extends BaseStatus {}

class SuccessStatus extends BaseStatus {}

class FailedStatus extends BaseStatus {
  final String exception;

  FailedStatus(this.exception);
}
