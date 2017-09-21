.class Lcom/boyaa/engine/device/PermissionsImpl$2;
.super Ljava/lang/Object;
.source "PermissionsImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/PermissionsImpl;->doRequest(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$permission:Ljava/lang/String;

.field private final synthetic val$reqId:I


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/PermissionsImpl$2;->val$permission:Ljava/lang/String;

    iput p2, p0, Lcom/boyaa/engine/device/PermissionsImpl$2;->val$reqId:I

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 144
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/boyaa/engine/device/PermissionsImpl$2;->val$permission:Ljava/lang/String;

    aput-object v3, v1, v2

    iget v2, p0, Lcom/boyaa/engine/device/PermissionsImpl$2;->val$reqId:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 145
    return-void
.end method
