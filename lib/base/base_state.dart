abstract class BaseState {
  bool isLoading();

  bool isSuccess();

  bool isError();

  String getErrorMessage();
}
