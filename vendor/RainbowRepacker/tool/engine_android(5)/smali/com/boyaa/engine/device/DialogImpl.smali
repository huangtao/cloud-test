.class public Lcom/boyaa/engine/device/DialogImpl;
.super Ljava/lang/Object;
.source "DialogImpl.java"


# static fields
.field private static final BUTTON_IDX_0:I = 0x0

.field private static final BUTTON_IDX_1:I = 0x1

.field private static dialogs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/boyaa/engine/device/DialogImpl;",
            ">;"
        }
    .end annotation
.end field

.field private static pause:Z


# instance fields
.field public btn1Text:Ljava/lang/String;

.field public btn2Text:Ljava/lang/String;

.field public dialog:Landroid/app/AlertDialog;

.field public id:I

.field public message:Ljava/lang/String;

.field public title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/boyaa/engine/device/DialogImpl;->dialogs:Ljava/util/HashMap;

    .line 13
    const/4 v0, 0x0

    sput-boolean v0, Lcom/boyaa/engine/device/DialogImpl;->pause:Z

    .line 15
    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/device/DialogImpl;->dialog:Landroid/app/AlertDialog;

    .line 33
    return-void
.end method

.method static synthetic access$0()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 12
    sget-object v0, Lcom/boyaa/engine/device/DialogImpl;->dialogs:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$1(Lcom/boyaa/engine/device/DialogImpl;I)V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/boyaa/engine/device/DialogImpl;->onCloseEvent(I)V

    return-void
.end method

.method public static close(I)V
    .locals 3
    .param p0, "id"    # I

    .prologue
    .line 111
    sget-object v1, Lcom/boyaa/engine/device/DialogImpl;->dialogs:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/engine/device/DialogImpl;

    .line 112
    .local v0, "dialogImpl":Lcom/boyaa/engine/device/DialogImpl;
    if-eqz v0, :cond_0

    .line 114
    sget-object v1, Lcom/boyaa/engine/device/DialogImpl;->dialogs:Ljava/util/HashMap;

    iget v2, v0, Lcom/boyaa/engine/device/DialogImpl;->id:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/boyaa/engine/device/DialogImpl$6;

    invoke-direct {v2, v0}, Lcom/boyaa/engine/device/DialogImpl$6;-><init>(Lcom/boyaa/engine/device/DialogImpl;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 123
    :cond_0
    return-void
.end method

.method public static init()V
    .locals 0

    .prologue
    .line 29
    return-void
.end method

.method static native nativeEvent(II)V
.end method

.method private onCloseEvent(I)V
    .locals 2
    .param p1, "idx"    # I

    .prologue
    .line 18
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v0

    new-instance v1, Lcom/boyaa/engine/device/DialogImpl$1;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/engine/device/DialogImpl$1;-><init>(Lcom/boyaa/engine/device/DialogImpl;I)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/device/Device;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 24
    return-void
.end method

.method public static onPause()V
    .locals 3

    .prologue
    .line 80
    const/4 v1, 0x1

    sput-boolean v1, Lcom/boyaa/engine/device/DialogImpl;->pause:Z

    .line 81
    sget-object v1, Lcom/boyaa/engine/device/DialogImpl;->dialogs:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v0, "dlg":Lcom/boyaa/engine/device/DialogImpl;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 84
    sget-object v1, Lcom/boyaa/engine/device/DialogImpl;->dialogs:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 85
    return-void

    .line 81
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "dlg":Lcom/boyaa/engine/device/DialogImpl;
    check-cast v0, Lcom/boyaa/engine/device/DialogImpl;

    .line 82
    .restart local v0    # "dlg":Lcom/boyaa/engine/device/DialogImpl;
    iget-object v2, v0, Lcom/boyaa/engine/device/DialogImpl;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->dismiss()V

    goto :goto_0
.end method

.method public static onResume()V
    .locals 1

    .prologue
    .line 88
    const/4 v0, 0x0

    sput-boolean v0, Lcom/boyaa/engine/device/DialogImpl;->pause:Z

    .line 89
    return-void
.end method

.method public static show(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p0, "id"    # I
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "btn1Text"    # Ljava/lang/String;
    .param p4, "btn2Text"    # Ljava/lang/String;

    .prologue
    .line 92
    sget-boolean v1, Lcom/boyaa/engine/device/DialogImpl;->pause:Z

    if-eqz v1, :cond_0

    .line 107
    :goto_0
    return-void

    .line 93
    :cond_0
    new-instance v0, Lcom/boyaa/engine/device/DialogImpl;

    invoke-direct {v0}, Lcom/boyaa/engine/device/DialogImpl;-><init>()V

    .line 94
    .local v0, "dialogImpl":Lcom/boyaa/engine/device/DialogImpl;
    iput p0, v0, Lcom/boyaa/engine/device/DialogImpl;->id:I

    .line 95
    iput-object p1, v0, Lcom/boyaa/engine/device/DialogImpl;->title:Ljava/lang/String;

    .line 96
    iput-object p2, v0, Lcom/boyaa/engine/device/DialogImpl;->message:Ljava/lang/String;

    .line 97
    iput-object p3, v0, Lcom/boyaa/engine/device/DialogImpl;->btn1Text:Ljava/lang/String;

    .line 98
    iput-object p4, v0, Lcom/boyaa/engine/device/DialogImpl;->btn2Text:Ljava/lang/String;

    .line 99
    sget-object v1, Lcom/boyaa/engine/device/DialogImpl;->dialogs:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/boyaa/engine/device/DialogImpl$5;

    invoke-direct {v2, v0}, Lcom/boyaa/engine/device/DialogImpl$5;-><init>(Lcom/boyaa/engine/device/DialogImpl;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method


# virtual methods
.method public show()V
    .locals 3

    .prologue
    .line 43
    sget-boolean v1, Lcom/boyaa/engine/device/DialogImpl;->pause:Z

    if-eqz v1, :cond_0

    .line 77
    :goto_0
    return-void

    .line 44
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 45
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v1, p0, Lcom/boyaa/engine/device/DialogImpl;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 46
    iget-object v1, p0, Lcom/boyaa/engine/device/DialogImpl;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 47
    iget-object v1, p0, Lcom/boyaa/engine/device/DialogImpl;->btn1Text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/boyaa/engine/device/DialogImpl;->btn2Text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 49
    iget-object v1, p0, Lcom/boyaa/engine/device/DialogImpl;->btn1Text:Ljava/lang/String;

    new-instance v2, Lcom/boyaa/engine/device/DialogImpl$2;

    invoke-direct {v2, p0}, Lcom/boyaa/engine/device/DialogImpl$2;-><init>(Lcom/boyaa/engine/device/DialogImpl;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 56
    iget-object v1, p0, Lcom/boyaa/engine/device/DialogImpl;->btn2Text:Ljava/lang/String;

    new-instance v2, Lcom/boyaa/engine/device/DialogImpl$3;

    invoke-direct {v2, p0}, Lcom/boyaa/engine/device/DialogImpl$3;-><init>(Lcom/boyaa/engine/device/DialogImpl;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 75
    :goto_1
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/engine/device/DialogImpl;->dialog:Landroid/app/AlertDialog;

    .line 76
    iget-object v1, p0, Lcom/boyaa/engine/device/DialogImpl;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 66
    :cond_1
    iget-object v1, p0, Lcom/boyaa/engine/device/DialogImpl;->btn1Text:Ljava/lang/String;

    new-instance v2, Lcom/boyaa/engine/device/DialogImpl$4;

    invoke-direct {v2, p0}, Lcom/boyaa/engine/device/DialogImpl$4;-><init>(Lcom/boyaa/engine/device/DialogImpl;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_1
.end method
