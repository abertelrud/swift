// RUN: %target-swift-emit-irgen -I %S/Inputs -enable-experimental-cxx-interop %s -validate-tbd-against-ir=none -Xcc -fignore-exceptions | %FileCheck %s

import MemberInheritance

func testGetX() -> CInt {
    let derivedDerived = makeCopyTrackedDerivedDerivedClass(42)!
    return derivedDerived.getX()
}

let _ = testGetX()


// CHECK: define {{.*}}linkonce_odr{{.*}} i32 @{{.*}}__synthesizedBaseCall___synthesizedBaseCall_{{.*}}(ptr {{.*}} %[[THIS_PTR:.*]])
// CHECK: %[[ADD_PTR:.*]] = getelementptr inbounds i8, ptr %{{.*}}, i64 4
// CHECK: call noundef i32 @{{.*}}(ptr {{.*}} %[[ADD_PTR]])
