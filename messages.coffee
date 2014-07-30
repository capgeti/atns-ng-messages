module = angular.module 'atns.ng.messages', ['ui.bootstrap']

module.controller 'ConfirmDialog', ($scope, $modalInstance, title, message, aktionOK)->
    $scope.title = title
    $scope.message = message
    $scope.aktionOK = aktionOK

    $scope.ok = ->
        do $modalInstance.close

    $scope.cancel = ->
        $modalInstance.dismiss 'cancel'


module.run ($rootScope, $modal)->
    $rootScope.confirmDialog = (title, message, aktionOK, action, args)->
        dialog = $modal.open
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
