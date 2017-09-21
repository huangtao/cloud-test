.class public Lcom/boyaa/app/core/HandlerManager;
.super Ljava/lang/Object;
.source "HandlerManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/app/core/HandlerManager$EventFunc;
    }
.end annotation


# static fields
.field public static final AR_CROP_PHOTO_REQUEST_CODE:I = 0x1003

.field public static final AR_DEVICE_PLUGIN_CONSTANT:I = 0x9999

.field public static final AR_OPEN_QQ_REQUEST_CODE:I = 0x1004

.field public static final AR_OPEN_WEIXIN_REQUEST_CODE:I = 0x1005

.field public static final AR_PICK_GALLERY_REQUEST_CODE:I = 0x1002

.field public static final AR_SCAN_QR_REQUEST_CODE:I = 0x1006

.field public static final AR_TAKE_PHOTO_REQUEST_CODE:I = 0x1001

.field public static final CALLBACK_CREATE_QR:Ljava/lang/String; = "onCreateQRCallBack"

.field public static final CALLBACK_SCAN_QR:Ljava/lang/String; = "onScanQRCallBack"

.field public static final GET_NETWORK_ACTIVITY:I = 0x201

.field public static final GET_NETWORK_AVAILABILITY:I = 0x200

.field public static final HANDER_IMSDK_RESULT:I = 0x4f0

.field public static final HANDER_OPEN_SHARE_APP_RESULT:I = 0x4ba

.field public static final HANDLER_ALIX_PAY:I = 0x2ca

.field public static final HANDLER_APP_ACTIVITYRESULT:I = 0x4c9

.field public static final HANDLER_AUTO_DIAL:I = 0x4ca

.field public static final HANDLER_AUTO_SELECT_DIAL:I = 0x4f8

.field public static final HANDLER_CHANGE_BRIGHTNESS:I = 0x4b2

.field public static final HANDLER_CHANGE_SCREEN_ORIENTATION:I = 0x4fb

.field public static final HANDLER_CHOOSE_IMAGE:I = 0x4de

.field public static final HANDLER_CLOSE_BACKGROUNDDIALOG:I = 0x205

.field public static final HANDLER_CLOSE_LOADING_DIALOG:I = 0x4da

.field public static final HANDLER_CLOSE_LOADING_SCENE:I = 0x204

.field public static final HANDLER_CLOSE_LOAD_FILE_DIALOG:I = 0x4c6

.field public static final HANDLER_CLOSE_SECRECY:I = 0x45c

.field public static final HANDLER_CREATE_QR_RESULT:I = 0x4f6

.field public static final HANDLER_CUSTOMER_SERVICE_CALLBACK:I = 0x4ff

.field public static final HANDLER_DEL_WEBVIEW:I = 0x4b6

.field public static final HANDLER_DEVICE_SHAKE:I = 0x458

.field public static final HANDLER_DOWNLOAD_FILE:I = 0x4c2

.field public static final HANDLER_DOWNLOAD_XML:I = 0x4c3

.field public static final HANDLER_DOWNLOAD_ZIP:I = 0x4c4

.field public static final HANDLER_GET_CONTACTS:I = 0x4cb

.field public static final HANDLER_GET_FEEDBACK_RESULT:I = 0x4be

.field public static final HANDLER_GET_LOCATION:I = 0x4dc

.field public static final HANDLER_GET_SIGNALSTRENGTH:I = 0x4dd

.field public static final HANDLER_GOBACK_WEBVIEW:I = 0x4b5

.field public static final HANDLER_HIDE_EMBED_WEBVIEW:I = 0x4ed

.field public static final HANDLER_HIDE_WEBVIEW:I = 0x7d0

.field public static final HANDLER_HUAJIAN_PAY:I = 0x2c7

.field public static final HANDLER_HUA_FU_BAO_PAY:I = 0x2ce

.field public static final HANDLER_INSTALL_APK:I = 0x4b8

.field public static final HANDLER_INSTALL_NWE_APK:I = 0x4d8

.field public static final HANDLER_MMBILLING_PAY:I = 0x2cf

.field public static final HANDLER_MOBILE_PAY:I = 0x2c6

.field public static final HANDLER_NEW_WEBVIEW:I = 0x4b3

.field public static final HANDLER_OPEN_FEEDBACK:I = 0x4b0

.field public static final HANDLER_OPEN_HELP:I = 0x45d

.field public static final HANDLER_OPEN_NET_SETTINGS:I = 0x4fa

.field public static final HANDLER_OPEN_SECRECY:I = 0x45b

.field public static final HANDLER_OPEN_SMS:I = 0x4f1

.field public static final HANDLER_OPEN_SMS_EDIT:I = 0x4f9

.field public static final HANDLER_OPEN_WEBPAGE:I = 0x4cc

.field public static final HANDLER_PRELOAD_SOUND:I = 0x3f2

.field public static final HANDLER_QIAN_CHI_PAY:I = 0x2cd

.field public static final HANDLER_RESEND_FEEDBACK:I = 0x45f

.field public static final HANDLER_SAVEIMAGE_TO_PHOTOALBUM:I = 0x4fe

.field public static final HANDLER_SAVE_HEAD:I = 0x32d

.field public static final HANDLER_SCAN_QR_RESULT:I = 0x4f7

.field public static final HANDLER_SEND_FEEDBACK:I = 0x45e

.field public static final HANDLER_SEND_FEEDBACK_CLOSETICKET:I = 0x4bf

.field public static final HANDLER_SEND_FEEDBACK_CLOSETICKETRESULT:I = 0x4c0

.field public static final HANDLER_SEND_FEEDBACK_RESULT:I = 0x4bd

.field public static final HANDLER_SET_NEWWORK:I = 0x202

.field public static final HANDLER_SET_WEBVIEWURL:I = 0x4b4

.field public static final HANDLER_SHARE_RESULT:I = 0x4b9

.field public static final HANDLER_SHOW_EMBED_WEBVIEW:I = 0x4ee

.field public static final HANDLER_SHOW_LOADING_DIALOG:I = 0x4d9

.field public static final HANDLER_SHOW_LOADING_SCENE:I = 0x203

.field public static final HANDLER_SHOW_LOAD_FILE_DIALOG:I = 0x4c5

.field public static final HANDLER_SHOW_START_DIALOG:I = 0x38e

.field public static final HANDLER_SHOW_TERMS_OF_SERVICE:I = 0x4bc

.field public static final HANDLER_SHOW_TOAST:I = 0x4db

.field public static final HANDLER_Start_TongYiPay:I = 0x2d0

.field public static final HANDLER_TELECOM_PAY:I = 0x2c9

.field public static final HANDLER_UMENG_ANALYTICS:I = 0x4bb

.field public static final HANDLER_UMENG_ERROR:I = 0x4c1

.field public static final HANDLER_UNION_PAY:I = 0x2cb

.field public static final HANDLER_UPDATE_APK:I = 0x4b7

.field public static final HANDLER_UPDATE_FEEDBACK:I = 0x4b1

.field public static final HANDLER_UPDATE_FEEDBACK_INFO:I = 0x4c7

.field public static final HANDLER_UPLOAD_DUMP_FILE:I = 0x4c8

.field public static final HANDLER_UPLOAD_FEEDBACK_IMAGE:I = 0x4df

.field public static final HANDLER_UPLOAD_LOG_FILE:I = 0x4e0

.field public static final HANDLER_VIBRATE_CANCLE:I = 0x459

.field public static final HANDLER_VIDEO_RESULT:I = 0x4ef

.field public static final HANDLER_WO_PAY:I = 0x2c8

.field public static final HANDLER_YIBAO_PAY:I = 0x2cc

.field public static final HANDMACHINE:I = 0x64

.field public static final IAPResponseInfo:Ljava/lang/String; = "IAPResponseInfo"

.field public static final IAPResponseRecord:Ljava/lang/String; = "IAPResponseRecord"

.field public static final SETMUSIC:I = 0x262

.field public static final SETSOUND:I = 0x263

.field public static final SMS_GET_PW:I = 0x209

.field public static final SMS_REGISTER:I = 0x208

.field public static final START_SCAN_QR:I = 0x4f5

.field public static final SYS_BATTERY_INFO:I = 0x20b

.field public static final SYS_DEVICE_ID:I = 0x206

.field public static final SYS_MACHINE_ID:I = 0x207

.field public static final SYS_MEMORY_INFO:I = 0x20c

.field public static final SYS_PHONE_INFO:I = 0x20a

.field public static final UPDATEVERSION:I = 0x1ff

.field public static final VERSION:I = 0x1fe

.field private static handlerMachine:Lcom/boyaa/app/core/HandlerManager; = null

.field public static final kAutoDial:Ljava/lang/String; = "autoDial"

.field public static final kAutoSelectDial:Ljava/lang/String; = "autoSelectDial"

.field public static final kCallResult:Ljava/lang/String; = "CallResult"

.field public static final kChangeScreenOrientation:Ljava/lang/String; = "changeScreenOrientation"

.field public static final kChangeScreenOrientationCallBack:Ljava/lang/String; = "changeScreenOrientationCallBack"

.field public static final kChooseImage:Ljava/lang/String; = "chooseImage"

.field public static final kCustomerServiceCallBack:Ljava/lang/String; = "onCustomerServiceCallBack"

.field public static final kDelWebView:Ljava/lang/String; = "DelWebView"

.field public static final kDownloadHead:Ljava/lang/String; = "DownloadHeadImage"

.field public static final kDownloadImage:Ljava/lang/String; = "DownloadImage"

.field public static final kGetApkInfo:Ljava/lang/String; = "getUninstallApkInfo"

.field public static final kGetAppInfo:Ljava/lang/String; = "getInstalledAppInfo"

.field public static final kGetAvailMemory:Ljava/lang/String; = "getAvailMemory"

.field public static final kGetBatteryLevel:Ljava/lang/String; = "GetBatteryLevel"

.field public static final kGetMemory:Ljava/lang/String; = "getMemory"

.field public static final kGetNetworkActivity:Ljava/lang/String; = "GetNetworkActivity"

.field public static final kGetNetworkAvailability:Ljava/lang/String; = "GetNetworkAvailability"

.field public static final kGetSignalStrength:Ljava/lang/String; = "getSignalStrength"

.field public static final kGoBackWebViewUrl:Ljava/lang/String; = "GoBackWebViewUrl"

.field public static final kHideEmbedWebView:Ljava/lang/String; = "HideEmbedWebView"

.field public static final kHideLoadingDialog:Ljava/lang/String; = "HideLoadingDialog"

.field public static final kHideLoadingScene:Ljava/lang/String; = "HideLoadingScene"

.field public static final kIapPayInfo:Ljava/lang/String; = "IAPPayInfo"

.field public static final kImSdkResultCallBack:Ljava/lang/String; = "kImSdkResultCallBack"

.field public static final kImageName:Ljava/lang/String; = "ImageName"

.field public static final kImageUrl:Ljava/lang/String; = "ImageUrl"

.field public static final kLuacallEvent:Ljava/lang/String; = "event_call"

.field public static final kNewWebView:Ljava/lang/String; = "NewWebView"

.field public static final kOpenNetSettings:Ljava/lang/String; = "openNetSettings"

.field public static final kOpenShareAppCallBack:Ljava/lang/String; = "openShareAppCallBack"

.field public static final kOpenSmsEdit:Ljava/lang/String; = "openSmsEdit"

.field public static final kOpenWebPage:Ljava/lang/String; = "openWebPage"

.field public static final kPreloadSound:Ljava/lang/String; = "preloadSound"

.field public static final kReSendFeedback:Ljava/lang/String; = "reSendFeedback"

.field public static final kResultPostfix:Ljava/lang/String; = "_result"

.field public static final kSaveHeadImageName:Ljava/lang/String; = "SaveHeadImageName"

.field public static final kSaveImageToPhotoAlbumCallBack:Ljava/lang/String; = "saveImageToPhotoAlbumCallBack"

.field public static final kSendFeedback:Ljava/lang/String; = "sendFeedback"

.field public static final kSetNetwork:Ljava/lang/String; = "setNetwork"

.field public static final kSetWebViewUrl:Ljava/lang/String; = "SetWebViewUrl"

.field public static final kShareResultCallBack:Ljava/lang/String; = "getWeiChatCallback"

.field public static final kShowEmbedWebView:Ljava/lang/String; = "ShowEmbedWebView"

.field public static final kShowLoadingDialog:Ljava/lang/String; = "ShowLoadingDialog"

.field public static final kShowLoadingScene:Ljava/lang/String; = "ShowLoadingScene"

.field public static final kShowToast:Ljava/lang/String; = "ShowToast"

.field public static final kShowVibrate:Ljava/lang/String; = "showVibrate"

.field public static final kSplashScreenFinish:Ljava/lang/String; = "splashScreenFinish"

.field public static final kStartTongYiPay:Ljava/lang/String; = "startTongYiPay"

.field public static final kUpdateAPK:Ljava/lang/String; = "updateAPK"

.field public static final kUploadFeedbackImage:Ljava/lang/String; = "uploadFeedbackImage"

.field public static kUploadHeadImage:Ljava/lang/String; = null

.field public static final kVersion_sync:Ljava/lang/String; = "Version_sync"

.field public static final kVideoResultCallback:Ljava/lang/String; = "videoResultCallback"

.field public static final kWeiChatShare:Ljava/lang/String; = "openWeiChatShare"

.field public static final kcallEvent:Ljava/lang/String; = "LuaEventCall"

.field public static final kparmPostfix:Ljava/lang/String; = "_parm"

.field public static final kupdateVersion:Ljava/lang/String; = "updateVersion"

.field public static final kversionCode:Ljava/lang/String; = "versionCode"

.field public static final kversionName:Ljava/lang/String; = "versionName"


# instance fields
.field private context:Lcom/boyaa/enginedlqp/maindevelop/Game;

.field private mEventMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/boyaa/app/core/HandlerManager$EventFunc;",
            ">;>;"
        }
    .end annotation
.end field

.field private mStringEventMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/boyaa/app/core/HandlerManager$EventFunc;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x0

    sput-object v0, Lcom/boyaa/app/core/HandlerManager;->handlerMachine:Lcom/boyaa/app/core/HandlerManager;

    .line 233
    const-string v0, "UploadHeadImage"

    sput-object v0, Lcom/boyaa/app/core/HandlerManager;->kUploadHeadImage:Ljava/lang/String;

    .line 311
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/boyaa/app/core/HandlerManager;->mEventMap:Ljava/util/HashMap;

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/boyaa/app/core/HandlerManager;->mStringEventMap:Ljava/util/HashMap;

    .line 38
    return-void
.end method

.method public static getHandlerManager()Lcom/boyaa/app/core/HandlerManager;
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lcom/boyaa/app/core/HandlerManager;->handlerMachine:Lcom/boyaa/app/core/HandlerManager;

    if-nez v0, :cond_0

    .line 42
    new-instance v0, Lcom/boyaa/app/core/HandlerManager;

    invoke-direct {v0}, Lcom/boyaa/app/core/HandlerManager;-><init>()V

    sput-object v0, Lcom/boyaa/app/core/HandlerManager;->handlerMachine:Lcom/boyaa/app/core/HandlerManager;

    .line 44
    :cond_0
    sget-object v0, Lcom/boyaa/app/core/HandlerManager;->handlerMachine:Lcom/boyaa/app/core/HandlerManager;

    return-object v0
.end method


# virtual methods
.method public addEventListener(Ljava/lang/Integer;Lcom/boyaa/app/core/HandlerManager$EventFunc;)V
    .locals 2
    .param p1, "event"    # Ljava/lang/Integer;
    .param p2, "func"    # Lcom/boyaa/app/core/HandlerManager$EventFunc;

    .prologue
    .line 480
    iget-object v1, p0, Lcom/boyaa/app/core/HandlerManager;->mEventMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 481
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/app/core/HandlerManager$EventFunc;>;"
    if-nez v0, :cond_0

    .line 482
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/app/core/HandlerManager$EventFunc;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 483
    .restart local v0    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/app/core/HandlerManager$EventFunc;>;"
    iget-object v1, p0, Lcom/boyaa/app/core/HandlerManager;->mEventMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    :cond_0
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 486
    return-void
.end method

.method public addEventListener(Ljava/lang/String;Lcom/boyaa/app/core/HandlerManager$EventFunc;)V
    .locals 2
    .param p1, "event_string"    # Ljava/lang/String;
    .param p2, "func"    # Lcom/boyaa/app/core/HandlerManager$EventFunc;

    .prologue
    .line 503
    iget-object v1, p0, Lcom/boyaa/app/core/HandlerManager;->mStringEventMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 504
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/app/core/HandlerManager$EventFunc;>;"
    if-nez v0, :cond_0

    .line 505
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/app/core/HandlerManager$EventFunc;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 506
    .restart local v0    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/app/core/HandlerManager$EventFunc;>;"
    iget-object v1, p0, Lcom/boyaa/app/core/HandlerManager;->mStringEventMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 508
    :cond_0
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 509
    return-void
.end method

.method public getParam(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 461
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "_parm"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 462
    .local v0, "param":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "HandlerManager.getParm()\u83b7\u53d6\u53c2\u6570\u503c\uff1a "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    return-object v0
.end method

.method public getParam(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "keys"    # [Ljava/lang/String;

    .prologue
    .line 467
    new-instance v2, Ljava/util/TreeMap;

    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    .line 469
    .local v2, "map":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, p2

    if-lt v0, v4, :cond_0

    .line 473
    new-instance v1, Lcom/boyaa/util/JsonUtil;

    invoke-direct {v1, v2}, Lcom/boyaa/util/JsonUtil;-><init>(Ljava/util/Map;)V

    .line 474
    .local v1, "jsonUtil":Lcom/boyaa/util/JsonUtil;
    invoke-virtual {v1}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v3

    .line 476
    .local v3, "result":Ljava/lang/String;
    return-object v3

    .line 470
    .end local v1    # "jsonUtil":Lcom/boyaa/util/JsonUtil;
    .end local v3    # "result":Ljava/lang/String;
    :cond_0
    aget-object v4, p2, v0

    aget-object v5, p2, v0

    invoke-static {p1, v5}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public handle(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 4
    .param p1, "what"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 404
    iget-object v2, p0, Lcom/boyaa/app/core/HandlerManager;->mStringEventMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 405
    .local v1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/app/core/HandlerManager$EventFunc;>;"
    if-nez v1, :cond_1

    .line 410
    :cond_0
    return-void

    .line 407
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/app/core/HandlerManager$EventFunc;

    .line 408
    .local v0, "func":Lcom/boyaa/app/core/HandlerManager$EventFunc;
    invoke-interface {v0, p2}, Lcom/boyaa/app/core/HandlerManager$EventFunc;->run(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public handleEvent(ILjava/lang/Object;)V
    .locals 4
    .param p1, "what"    # I
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 413
    iget-object v2, p0, Lcom/boyaa/app/core/HandlerManager;->mEventMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 414
    .local v1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/app/core/HandlerManager$EventFunc;>;"
    if-nez v1, :cond_1

    .line 419
    :cond_0
    return-void

    .line 416
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/app/core/HandlerManager$EventFunc;

    .line 417
    .local v0, "func":Lcom/boyaa/app/core/HandlerManager$EventFunc;
    invoke-interface {v0, p2}, Lcom/boyaa/app/core/HandlerManager$EventFunc;->run(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public handler(ILjava/lang/Object;Ljava/lang/String;)V
    .locals 11
    .param p1, "what"    # I
    .param p2, "data"    # Ljava/lang/Object;
    .param p3, "callLuaEvent"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x1

    .line 322
    const-string v6, "guangli.liu"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "handler"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->getId()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/boyaa/app/debug/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    sparse-switch p1, :sswitch_data_0

    .line 396
    invoke-virtual {p0, p1, p2}, Lcom/boyaa/app/core/HandlerManager;->handleEvent(ILjava/lang/Object;)V

    .line 400
    .end local p2    # "data":Ljava/lang/Object;
    :goto_0
    return-void

    .line 326
    .restart local p2    # "data":Ljava/lang/Object;
    :sswitch_0
    new-instance v3, Lcom/boyaa/util/ThreadUtil;

    invoke-direct {v3}, Lcom/boyaa/util/ThreadUtil;-><init>()V

    .line 327
    .local v3, "threadUtil":Lcom/boyaa/util/ThreadUtil;
    check-cast p2, Ljava/lang/String;

    .end local p2    # "data":Ljava/lang/Object;
    invoke-virtual {v3, p2}, Lcom/boyaa/util/ThreadUtil;->doPreloadSound(Ljava/lang/String;)V

    goto :goto_0

    .line 330
    .end local v3    # "threadUtil":Lcom/boyaa/util/ThreadUtil;
    .restart local p2    # "data":Ljava/lang/Object;
    :sswitch_1
    invoke-static {}, Lcom/boyaa/util/ToolKit;->GetNetworkAvailability()V

    goto :goto_0

    .line 333
    :sswitch_2
    invoke-static {}, Lcom/boyaa/util/ToolKit;->GetNetworkActivity()V

    goto :goto_0

    .line 336
    :sswitch_3
    invoke-static {}, Lcom/boyaa/util/ToolKit;->setNetworkMethod()V

    goto :goto_0

    .line 339
    :sswitch_4
    const-string v6, "getDeviceId"

    sget-object v7, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v7, v10}, Lcom/boyaa/app/sys/SystemInfo;->onGetDeviceId(Landroid/app/Activity;Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 342
    :sswitch_5
    const-string v6, "getMachineId"

    sget-object v7, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v7, v10}, Lcom/boyaa/app/sys/SystemInfo;->onGetMachineId(Landroid/app/Activity;Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 345
    :sswitch_6
    sget-object v6, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v6, p2}, Lcom/boyaa/util/SmsUtil;->sendSms(Landroid/app/Activity;Ljava/lang/Object;)V

    goto :goto_0

    .line 348
    :sswitch_7
    const-string v6, "sendSmsByGetNewPW"

    sget-object v7, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v7, v10}, Lcom/boyaa/app/sys/SystemInfo;->onGetMachineId(Landroid/app/Activity;Z)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 351
    :sswitch_8
    const-string v6, "getPhoneInfo"

    sget-object v7, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v7}, Lcom/boyaa/app/sys/SystemInfo;->LocalInfo(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 354
    :sswitch_9
    const/4 v6, 0x2

    new-array v2, v6, [J

    const-wide/16 v6, 0x1f4

    aput-wide v6, v2, v10

    .line 355
    .local v2, "ptn":[J
    const/4 v6, -0x1

    invoke-static {v2, v6}, Lcom/boyaa/enginedlqp/maindevelop/Game;->vibrate([JI)V

    goto :goto_0

    .line 358
    .end local v2    # "ptn":[J
    :sswitch_a
    new-instance v1, Lcom/boyaa/app/file/FileDownload;

    invoke-direct {v1}, Lcom/boyaa/app/file/FileDownload;-><init>()V

    .line 359
    .local v1, "fileDownload":Lcom/boyaa/app/file/FileDownload;
    check-cast p2, Ljava/lang/String;

    .end local p2    # "data":Ljava/lang/Object;
    invoke-virtual {v1, p2, p3}, Lcom/boyaa/app/file/FileDownload;->doDownload(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 362
    .end local v1    # "fileDownload":Lcom/boyaa/app/file/FileDownload;
    .restart local p2    # "data":Ljava/lang/Object;
    :sswitch_b
    const-string v6, "GetBatteryLevel"

    invoke-static {v6}, Lcom/boyaa/util/BatteryUtil;->getBatteryLevel(Ljava/lang/String;)V

    goto :goto_0

    .line 366
    :sswitch_c
    sget-object v6, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v7, Lcom/boyaa/app/core/HandlerManager$1;

    invoke-direct {v7, p0}, Lcom/boyaa/app/core/HandlerManager$1;-><init>(Lcom/boyaa/app/core/HandlerManager;)V

    invoke-virtual {v6, v7}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 381
    :sswitch_d
    invoke-static {}, Lcom/boyaa/util/MemoryUtil;->getMemory()V

    goto :goto_0

    .line 384
    :sswitch_e
    new-instance v4, Lcom/boyaa/entity/statistics/UploadDumpFile;

    invoke-direct {v4}, Lcom/boyaa/entity/statistics/UploadDumpFile;-><init>()V

    .line 385
    .local v4, "uploadDumpFile":Lcom/boyaa/entity/statistics/UploadDumpFile;
    check-cast p2, Ljava/lang/String;

    .end local p2    # "data":Ljava/lang/Object;
    invoke-virtual {v4, p2}, Lcom/boyaa/entity/statistics/UploadDumpFile;->execute(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 388
    .end local v4    # "uploadDumpFile":Lcom/boyaa/entity/statistics/UploadDumpFile;
    .restart local p2    # "data":Ljava/lang/Object;
    :sswitch_f
    new-instance v5, Lcom/boyaa/entity/statistics/UploadLogFile;

    invoke-direct {v5}, Lcom/boyaa/entity/statistics/UploadLogFile;-><init>()V

    .line 389
    .local v5, "uploadLogFile":Lcom/boyaa/entity/statistics/UploadLogFile;
    check-cast p2, Ljava/lang/String;

    .end local p2    # "data":Ljava/lang/Object;
    invoke-virtual {v5, p2}, Lcom/boyaa/entity/statistics/UploadLogFile;->execute(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 392
    .end local v5    # "uploadLogFile":Lcom/boyaa/entity/statistics/UploadLogFile;
    .restart local p2    # "data":Ljava/lang/Object;
    :sswitch_10
    new-instance v0, Lcom/boyaa/extension/Contacts;

    invoke-direct {v0}, Lcom/boyaa/extension/Contacts;-><init>()V

    .line 393
    .local v0, "contacts":Lcom/boyaa/extension/Contacts;
    check-cast p2, Ljava/lang/String;

    .end local p2    # "data":Ljava/lang/Object;
    invoke-virtual {v0, p2}, Lcom/boyaa/extension/Contacts;->execute(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 323
    nop

    :sswitch_data_0
    .sparse-switch
        0x200 -> :sswitch_1
        0x201 -> :sswitch_2
        0x202 -> :sswitch_3
        0x206 -> :sswitch_4
        0x207 -> :sswitch_5
        0x208 -> :sswitch_6
        0x209 -> :sswitch_7
        0x20a -> :sswitch_8
        0x20b -> :sswitch_b
        0x20c -> :sswitch_d
        0x3f2 -> :sswitch_0
        0x458 -> :sswitch_9
        0x4c2 -> :sswitch_a
        0x4c8 -> :sswitch_e
        0x4cb -> :sswitch_10
        0x4dd -> :sswitch_c
        0x4e0 -> :sswitch_f
    .end sparse-switch
.end method

.method public luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "result"    # Ljava/lang/String;

    .prologue
    .line 431
    const-string v0, "LuaEventCall"

    const-string v1, "LuaEventCall"

    invoke-static {v0, v1, p1}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    if-eqz p2, :cond_0

    .line 433
    const-string v0, "CallResult"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 434
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "_result"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, p2}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 439
    :goto_0
    const-string v0, "event_call"

    invoke-static {v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->call_lua(Ljava/lang/String;)I

    .line 440
    return-void

    .line 436
    :cond_0
    const-string v0, "CallResult"

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    goto :goto_0
.end method

.method public luaCallEventFail(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "result"    # Ljava/lang/String;

    .prologue
    .line 452
    const-string v0, "LuaEventCall"

    const-string v1, "LuaEventCall"

    invoke-static {v0, v1, p1}, Lcom/boyaa/engine/made/Dict;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    const-string v0, "CallResult"

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 454
    const-string v0, "event_call"

    invoke-static {v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->call_lua(Ljava/lang/String;)I

    .line 455
    return-void
.end method

.method public removeEventListener(Ljava/lang/Integer;Lcom/boyaa/app/core/HandlerManager$EventFunc;)V
    .locals 2
    .param p1, "event"    # Ljava/lang/Integer;
    .param p2, "func"    # Lcom/boyaa/app/core/HandlerManager$EventFunc;

    .prologue
    .line 489
    iget-object v1, p0, Lcom/boyaa/app/core/HandlerManager;->mEventMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 490
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/app/core/HandlerManager$EventFunc;>;"
    if-nez v0, :cond_0

    .line 493
    :goto_0
    return-void

    .line 492
    :cond_0
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public removeEventListener(Ljava/lang/String;Lcom/boyaa/app/core/HandlerManager$EventFunc;)V
    .locals 2
    .param p1, "event_string"    # Ljava/lang/String;
    .param p2, "func"    # Lcom/boyaa/app/core/HandlerManager$EventFunc;

    .prologue
    .line 512
    iget-object v1, p0, Lcom/boyaa/app/core/HandlerManager;->mStringEventMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 513
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/app/core/HandlerManager$EventFunc;>;"
    if-nez v0, :cond_0

    .line 516
    :goto_0
    return-void

    .line 515
    :cond_0
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public removeEventListeners(Ljava/lang/Integer;)V
    .locals 2
    .param p1, "event"    # Ljava/lang/Integer;

    .prologue
    .line 496
    iget-object v1, p0, Lcom/boyaa/app/core/HandlerManager;->mEventMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 497
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/app/core/HandlerManager$EventFunc;>;"
    if-nez v0, :cond_0

    .line 500
    :goto_0
    return-void

    .line 499
    :cond_0
    iget-object v1, p0, Lcom/boyaa/app/core/HandlerManager;->mEventMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public removeEventListeners(Ljava/lang/String;)V
    .locals 2
    .param p1, "event_string"    # Ljava/lang/String;

    .prologue
    .line 519
    iget-object v1, p0, Lcom/boyaa/app/core/HandlerManager;->mStringEventMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 520
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/app/core/HandlerManager$EventFunc;>;"
    if-nez v0, :cond_0

    .line 523
    :goto_0
    return-void

    .line 522
    :cond_0
    iget-object v1, p0, Lcom/boyaa/app/core/HandlerManager;->mStringEventMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public setContext(Lcom/boyaa/enginedlqp/maindevelop/Game;)V
    .locals 0
    .param p1, "context"    # Lcom/boyaa/enginedlqp/maindevelop/Game;

    .prologue
    .line 314
    iput-object p1, p0, Lcom/boyaa/app/core/HandlerManager;->context:Lcom/boyaa/enginedlqp/maindevelop/Game;

    .line 315
    return-void
.end method
