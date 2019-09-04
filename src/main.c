
#include <version.h>    // this is autogenerte by cmake
#include <stdio.h>


int main() {

  printf("This app is built from git commit: %s, commit date %s\n", GIT_REVISION,
         COMMIT_TIMESTAMP);
  printf("With auto build number %s\n", THISBUILD);
  printf("Built on %s %s\n", COMPILE_DATE, COMPILE_TIME);
  return 0;

}
