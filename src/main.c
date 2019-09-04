
#include <version.h>    // this is autogenerte by cmake
#include <stdio.h>


int main() {

  printf("This app is built from git commit: %s, commit date %s\n", GIT_REVISION,
         BUILD_TIMESTAMP);
  printf("With auto build number %s\n", THISBUILD);
  return 0;

}
