.class public Lcom/boyaa/engine/device/PermissionsImpl;
.super Ljava/lang/Object;
.source "PermissionsImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/engine/device/PermissionsImpl$Listener;
    }
.end annotation


# static fields
.field private static final PERMISSION_ID_START:I = 0x0

.field private static REQ_ID_CAMERA:I = 0x0

.field private static REQ_ID_CONTACTS:I = 0x0

.field private static REQ_ID_PHONE_STATE:I = 0x0

.field private static REQ_ID_PHOTO_LIBRARY:I = 0x0

.field private static final STATUS_DENIED:I = 0x2

.field private static final STATUS_GRANTED:I = 0x1

.field private static final STATUS_NOT_DETERMINED:I = 0x0

.field private static final STATUS_RESTRICTED:I = 0x3

.field private static final TYPE_CAMERA:I = 0x1

.field private static final TYPE_CONTACTS:I = 0x3

.field private static final TYPE_END:I = 0x4

.field private static final TYPE_PHONE_STATE:I = 0x4

.field private static final TYPE_PHOTO_LIBRARY:I = 0x2

.field private static final TYPE_START:I = 0x1

.field private static params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static syncParams:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 45
    sput v0, Lcom/boyaa/engine/device/PermissionsImpl;->REQ_ID_CAMERA:I

    .line 46
    sput v0, Lcom/boyaa/engine/device/PermissionsImpl;->REQ_ID_PHOTO_LIBRARY:I

    .line 47
    sput v0, Lcom/boyaa/engine/device/PermissionsImpl;->REQ_ID_CONTACTS:I

    .line 48
    sput v0, Lcom/boyaa/engine/device/PermissionsImpl;->REQ_ID_PHONE_STATE:I

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/boyaa/engine/device/PermissionsImpl;->params:Ljava/util/Map;

    .line 52
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/boyaa/engine/device/PermissionsImpl;->syncParams:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(II)V
    .locals 0

    .prologue
    .line 137
    invoke-static {p0, p1}, Lcom/boyaa/engine/device/PermissionsImpl;->doRequest(II)V

    return-void
.end method

.method static synthetic access$1(IZ)V
    .locals 0

    .prologue
    .line 16
    invoke-static {p0, p1}, Lcom/boyaa/engine/device/PermissionsImpl;->onResult(IZ)V

    return-void
.end method

.method private static doRequest(II)V
    .locals 4
    .param p0, "type"    # I
    .param p1, "id"    # I

    .prologue
    .line 138
    invoke-static {p0}, Lcom/boyaa/engine/device/PermissionsImpl;->getPermissionString(I)Ljava/lang/String;

    move-result-object v0

    .line 139
    .local v0, "permission":Ljava/lang/String;
    invoke-static {p0}, Lcom/boyaa/engine/device/PermissionsImpl;->getRequestId(I)I

    move-result v1

    .line 140
    .local v1, "reqId":I
    invoke-static {p1, v1}, Lcom/boyaa/engine/device/PermissionsImpl;->storeParam(II)V

    .line 141
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Lcom/boyaa/engine/device/PermissionsImpl$2;

    invoke-direct {v3, v0, v1}, Lcom/boyaa/engine/device/PermissionsImpl$2;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 147
    return-void
.end method

.method private static extractParam(I)I
    .locals 5
    .param p0, "reqId"    # I

    .prologue
    .line 69
    const/4 v1, -0x1

    .line 70
    .local v1, "id":I
    sget-object v3, Lcom/boyaa/engine/device/PermissionsImpl;->syncParams:Ljava/lang/Object;

    monitor-enter v3

    .line 71
    :try_start_0
    sget-object v2, Lcom/boyaa/engine/device/PermissionsImpl;->params:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 78
    :goto_0
    if-ltz v1, :cond_1

    .line 79
    sget-object v2, Lcom/boyaa/engine/device/PermissionsImpl;->params:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    :cond_1
    monitor-exit v3

    .line 82
    return v1

    .line 71
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 73
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne p0, v2, :cond_0

    .line 74
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 75
    goto :goto_0

    .line 70
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private static getPermissionString(I)Ljava/lang/String;
    .locals 1
    .param p0, "type"    # I

    .prologue
    .line 86
    const-string v0, ""

    .line 87
    .local v0, "permission":Ljava/lang/String;
    packed-switch p0, :pswitch_data_0

    .line 103
    :goto_0
    return-object v0

    .line 89
    :pswitch_0
    const-string v0, "android.permission.CAMERA"

    .line 90
    goto :goto_0

    .line 92
    :pswitch_1
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 93
    goto :goto_0

    .line 95
    :pswitch_2
    const-string v0, "android.permission.READ_CONTACTS"

    .line 96
    goto :goto_0

    .line 98
    :pswitch_3
    const-string v0, "android.permission.READ_PHONE_STATE"

    .line 99
    goto :goto_0

    .line 87
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private static getRequestId(I)I
    .locals 1
    .param p0, "type"    # I

    .prologue
    .line 107
    const/4 v0, 0x0

    .line 108
    .local v0, "reqId":I
    packed-switch p0, :pswitch_data_0

    .line 124
    :goto_0
    return v0

    .line 110
    :pswitch_0
    sget v0, Lcom/boyaa/engine/device/PermissionsImpl;->REQ_ID_CAMERA:I

    .line 111
    goto :goto_0

    .line 113
    :pswitch_1
    sget v0, Lcom/boyaa/engine/device/PermissionsImpl;->REQ_ID_PHOTO_LIBRARY:I

    .line 114
    goto :goto_0

    .line 116
    :pswitch_2
    sget v0, Lcom/boyaa/engine/device/PermissionsImpl;->REQ_ID_CONTACTS:I

    .line 117
    goto :goto_0

    .line 119
    :pswitch_3
    sget v0, Lcom/boyaa/engine/device/PermissionsImpl;->REQ_ID_PHONE_STATE:I

    .line 120
    goto :goto_0

    .line 108
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static getStatus(I)I
    .locals 3
    .param p0, "type"    # I

    .prologue
    .line 128
    invoke-static {p0}, Lcom/boyaa/engine/device/PermissionsImpl;->getPermissionString(I)Ljava/lang/String;

    move-result-object v0

    .line 129
    .local v0, "permission":Ljava/lang/String;
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, v0}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    .line 130
    .local v1, "result":I
    if-nez v1, :cond_0

    .line 131
    const/4 v2, 0x1

    .line 134
    :goto_0
    return v2

    .line 132
    :cond_0
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, v0}, Landroid/support/v4/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 133
    const/4 v2, 0x2

    goto :goto_0

    .line 134
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static init(I)V
    .locals 2
    .param p0, "activityRequestPermissionCodeBegin"    # I

    .prologue
    .line 55
    move v0, p0

    .line 56
    .local v0, "code":I
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "code":I
    .local v1, "code":I
    sput v0, Lcom/boyaa/engine/device/PermissionsImpl;->REQ_ID_CAMERA:I

    .line 57
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "code":I
    .restart local v0    # "code":I
    sput v1, Lcom/boyaa/engine/device/PermissionsImpl;->REQ_ID_PHOTO_LIBRARY:I

    .line 58
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "code":I
    .restart local v1    # "code":I
    sput v0, Lcom/boyaa/engine/device/PermissionsImpl;->REQ_ID_CONTACTS:I

    .line 59
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "code":I
    .restart local v0    # "code":I
    sput v1, Lcom/boyaa/engine/device/PermissionsImpl;->REQ_ID_PHONE_STATE:I

    .line 60
    return-void
.end method

.method static native nativeEvent(IZ)V
.end method

.method public static onRequestPermissionsResult(I[Ljava/lang/String;[I)Z
    .locals 4
    .param p0, "requestCode"    # I
    .param p1, "permissions"    # [Ljava/lang/String;
    .param p2, "grantResults"    # [I

    .prologue
    const/4 v2, 0x1

    const/4 v0, 0x0

    .line 185
    invoke-static {p0}, Lcom/boyaa/engine/device/PermissionsImpl;->extractParam(I)I

    move-result v1

    .line 186
    .local v1, "id":I
    if-ltz v1, :cond_1

    .line 187
    if-eqz p2, :cond_0

    array-length v3, p2

    if-lez v3, :cond_0

    aget v3, p2, v0

    if-nez v3, :cond_0

    move v0, v2

    .line 188
    .local v0, "granted":Z
    :cond_0
    invoke-static {v1, v0}, Lcom/boyaa/engine/device/PermissionsImpl;->onResult(IZ)V

    .line 191
    .end local v0    # "granted":Z
    :goto_0
    return v2

    :cond_1
    move v2, v0

    goto :goto_0
.end method

.method private static onResult(IZ)V
    .locals 2
    .param p0, "id"    # I
    .param p1, "granted"    # Z

    .prologue
    .line 18
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v0

    new-instance v1, Lcom/boyaa/engine/device/PermissionsImpl$1;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/engine/device/PermissionsImpl$1;-><init>(IZ)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/device/Device;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 24
    return-void
.end method

.method public static request(II)V
    .locals 1
    .param p0, "type"    # I
    .param p1, "id"    # I

    .prologue
    .line 152
    invoke-static {p0}, Lcom/boyaa/engine/device/PermissionsImpl;->getStatus(I)I

    move-result v0

    if-nez v0, :cond_0

    .line 153
    invoke-static {p0, p1}, Lcom/boyaa/engine/device/PermissionsImpl;->doRequest(II)V

    .line 157
    :goto_0
    return-void

    .line 155
    :cond_0
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/boyaa/engine/device/PermissionsImpl;->onResult(IZ)V

    goto :goto_0
.end method

.method public static requestReason(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "type"    # I
    .param p1, "id"    # I
    .param p2, "reason"    # Ljava/lang/String;
    .param p3, "ok"    # Ljava/lang/String;
    .param p4, "cancel"    # Ljava/lang/String;

    .prologue
    .line 161
    new-instance v0, Lcom/boyaa/engine/device/PermissionsImpl$3;

    invoke-direct {v0, p0, p1}, Lcom/boyaa/engine/device/PermissionsImpl$3;-><init>(II)V

    .line 166
    new-instance v1, Lcom/boyaa/engine/device/PermissionsImpl$4;

    invoke-direct {v1, p1}, Lcom/boyaa/engine/device/PermissionsImpl$4;-><init>(I)V

    .line 161
    invoke-static {p2, p3, p4, v0, v1}, Lcom/boyaa/engine/device/PermissionsImpl;->showDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V

    .line 172
    return-void
.end method

.method private static showDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 7
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "ok"    # Ljava/lang/String;
    .param p2, "cancel"    # Ljava/lang/String;
    .param p3, "okListener"    # Landroid/content/DialogInterface$OnClickListener;
    .param p4, "cancelListener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 175
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v0, Lcom/boyaa/engine/device/PermissionsImpl$5;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p3

    move-object v4, p2

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/boyaa/engine/device/PermissionsImpl$5;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V

    invoke-virtual {v6, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 181
    return-void
.end method

.method private static storeParam(II)V
    .locals 4
    .param p0, "id"    # I
    .param p1, "reqId"    # I

    .prologue
    .line 63
    sget-object v1, Lcom/boyaa/engine/device/PermissionsImpl;->syncParams:Ljava/lang/Object;

    monitor-enter v1

    .line 64
    :try_start_0
    sget-object v0, Lcom/boyaa/engine/device/PermissionsImpl;->params:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    monitor-exit v1

    .line 66
    return-void

    .line 63
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
