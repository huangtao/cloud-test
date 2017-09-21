.class Lcom/boyaa/engine/device/PermissionsImpl$5;
.super Ljava/lang/Object;
.source "PermissionsImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/PermissionsImpl;->showDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$cancel:Ljava/lang/String;

.field private final synthetic val$cancelListener:Landroid/content/DialogInterface$OnClickListener;

.field private final synthetic val$message:Ljava/lang/String;

.field private final synthetic val$ok:Ljava/lang/String;

.field private final synthetic val$okListener:Landroid/content/DialogInterface$OnClickListener;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/PermissionsImpl$5;->val$message:Ljava/lang/String;

    iput-object p2, p0, Lcom/boyaa/engine/device/PermissionsImpl$5;->val$ok:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/engine/device/PermissionsImpl$5;->val$okListener:Landroid/content/DialogInterface$OnClickListener;

    iput-object p4, p0, Lcom/boyaa/engine/device/PermissionsImpl$5;->val$cancel:Ljava/lang/String;

    iput-object p5, p0, Lcom/boyaa/engine/device/PermissionsImpl$5;->val$cancelListener:Landroid/content/DialogInterface$OnClickListener;

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 178
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/boyaa/engine/device/PermissionsImpl$5;->val$message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/engine/device/PermissionsImpl$5;->val$ok:Ljava/lang/String;

    iget-object v2, p0, Lcom/boyaa/engine/device/PermissionsImpl$5;->val$okListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/engine/device/PermissionsImpl$5;->val$cancel:Ljava/lang/String;

    iget-object v2, p0, Lcom/boyaa/engine/device/PermissionsImpl$5;->val$cancelListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 179
    return-void
.end method
