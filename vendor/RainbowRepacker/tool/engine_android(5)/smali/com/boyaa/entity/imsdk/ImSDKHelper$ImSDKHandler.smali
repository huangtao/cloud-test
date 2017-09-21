.class Lcom/boyaa/entity/imsdk/ImSDKHelper$ImSDKHandler;
.super Landroid/os/Handler;
.source "ImSDKHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/entity/imsdk/ImSDKHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ImSDKHandler"
.end annotation


# instance fields
.field private final mHelper:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/boyaa/entity/imsdk/ImSDKHelper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/boyaa/entity/imsdk/ImSDKHelper;)V
    .locals 1
    .param p1, "helper"    # Lcom/boyaa/entity/imsdk/ImSDKHelper;

    .prologue
    .line 137
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 138
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/boyaa/entity/imsdk/ImSDKHelper$ImSDKHandler;->mHelper:Ljava/lang/ref/WeakReference;

    .line 139
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 143
    iget-object v1, p0, Lcom/boyaa/entity/imsdk/ImSDKHelper$ImSDKHandler;->mHelper:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/entity/imsdk/ImSDKHelper;

    .line 144
    .local v0, "helper":Lcom/boyaa/entity/imsdk/ImSDKHelper;
    if-eqz v0, :cond_0

    .line 145
    invoke-virtual {v0, p1}, Lcom/boyaa/entity/imsdk/ImSDKHelper;->handleMessage(Landroid/os/Message;)V

    .line 147
    :cond_0
    return-void
.end method
