.class Lcom/boyaa/engine/device/PermissionsImpl$4;
.super Ljava/lang/Object;
.source "PermissionsImpl.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/PermissionsImpl;->requestReason(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$id:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 1
    iput p1, p0, Lcom/boyaa/engine/device/PermissionsImpl$4;->val$id:I

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 169
    iget v0, p0, Lcom/boyaa/engine/device/PermissionsImpl$4;->val$id:I

    const/4 v1, 0x0

    # invokes: Lcom/boyaa/engine/device/PermissionsImpl;->onResult(IZ)V
    invoke-static {v0, v1}, Lcom/boyaa/engine/device/PermissionsImpl;->access$1(IZ)V

    .line 170
    return-void
.end method
