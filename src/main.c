
#include <version.h>    // this is autogenerte by cmake
#include <stdio.h>


int main() {

  printf("Commit: %s, %s\n", GIT_REVISION, COMMIT_TIMESTAMP);
  printf("Version: %s %s %s\n", THISBUILD, COMPILE_DATE, COMPILE_TIME);
  return 0;

}
