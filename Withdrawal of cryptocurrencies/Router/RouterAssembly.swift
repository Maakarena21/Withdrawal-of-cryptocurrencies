

import EasyDi


class RouterAssembly: Assembly {
    func router(view: UIViewController) -> Router {
        define(init: RouterImpl()) {
            $0.viewController = view
            return $0
        }
    }
}
