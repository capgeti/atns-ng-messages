module = angular.module 'atns.ng.messages', ['ui.bootstrap', 'partials/confirm-dialog.html']

module.controller 'ConfirmDialog', ($scope, $uibModalInstance, title, message, aktionOK)->
    $scope.title = title
    $scope.message = message
    $scope.aktionOK = aktionOK

    $scope.ok = ->
        do $uibModalInstance.close

    $scope.cancel = ->
        $uibModalInstance.dismiss 'cancel'


module.run ($rootScope, $uibModal)->
    $rootScope.confirmDialog = (title, message, aktionOK, action, args)->
        dialog = $uibModal.open
            templateUrl: 'partials/confirm-dialog.html'
            controller: 'ConfirmDialog'
            resolve:
                title: ->
                    title
                message: ->
                    message
                aktionOK: ->
                    aktionOK

        dialog.result.then ->
            action args


angular.module 'partials/confirm-dialog.html', []
.run ($templateCache)->
    $templateCache.put 'partials/confirm-dialog.html', """
        <div class="modal-header">
            <button type="button" class="close" ng-click="cancel()">×</button>
            <h3>{{title}}</h3>
        </div>
        <div class="modal-body">
            <p>{{message}}</p>
        </div>
        <div class="modal-footer">
            <button class="btn btn-default btn-sm" ng-click="cancel()" tabindex="-1">Abbrechen</button>
            <button class="btn btn-warning btn-sm" ng-click="ok()">
                {{aktionOK}}
            </button>
        </div>
    """

