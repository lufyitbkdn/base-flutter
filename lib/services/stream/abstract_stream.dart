abstract class AppStreamSubjectInterface<T> {
  void dispose();
  void drainStream();
  void updateSubject(T? data);
}
