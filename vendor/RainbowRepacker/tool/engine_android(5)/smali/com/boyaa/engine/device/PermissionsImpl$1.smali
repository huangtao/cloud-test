.class Lcom/boyaa/engine/device/PermissionsImpl$1;
.super Ljava/lang/Object;
.source "PermissionsImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/PermissionsImpl;->onResult(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$granted:Z

.field private final synthetic val$id:I


# direct methods
.method constructor <init>(IZ)V
    .locals 0

    .prologue
    .line 1
    iput p1, p0, Lcom/boyaa/engine/device/PermissionsImpl$1;->val$id:I

    iput-boolean p2, p0, Lcom/boyaa/engine/device/PermissionsImpl$1;->val$granted:Z

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 21
    iget v0, p0, Lcom/boyaa/engine/device/PermissionsImpl$1;->val$id:I

    iget-boolean v1, p0, Lcom/boyaa/engine/device/PermissionsImpl$1;->val$granted:Z

    invoke-static {v0, v1}, Lcom/boyaa/engine/device/PermissionsImpl;->nativeEvent(IZ)V

    .line 22
    return-void
.end method
