.class Lcom/boyaa/engine/device/PermissionsImpl$3;
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

.field private final synthetic val$type:I


# direct methods
.method constructor <init>(II)V
    .locals 0

    .prologue
    .line 1
    iput p1, p0, Lcom/boyaa/engine/device/PermissionsImpl$3;->val$type:I

    iput p2, p0, Lcom/boyaa/engine/device/PermissionsImpl$3;->val$id:I

    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 164
    iget v0, p0, Lcom/boyaa/engine/device/PermissionsImpl$3;->val$type:I

    iget v1, p0, Lcom/boyaa/engine/device/PermissionsImpl$3;->val$id:I

    # invokes: Lcom/boyaa/engine/device/PermissionsImpl;->doRequest(II)V
    invoke-static {v0, v1}, Lcom/boyaa/engine/device/PermissionsImpl;->access$0(II)V

    .line 165
    return-void
.end method
