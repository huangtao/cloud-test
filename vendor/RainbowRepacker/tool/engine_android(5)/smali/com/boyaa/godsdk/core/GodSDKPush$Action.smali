.class public final Lcom/boyaa/godsdk/core/GodSDKPush$Action;
.super Ljava/lang/Object;
.source "GodSDKPush.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/godsdk/core/GodSDKPush;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Action"
.end annotation


# static fields
.field public static final RECEIVE_RAW_DATA:Ljava/lang/String; = "com.boyaa.godsdk.action.GodSDKPush.RECEIVE_RAW_DATA"

.field public static final RECEIVE_REGISTRATION_ID:Ljava/lang/String; = "com.boyaa.godsdk.action.GodSDKPush.RECEIVE_REGISTRATION_ID"


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/core/GodSDKPush;


# direct methods
.method public constructor <init>(Lcom/boyaa/godsdk/core/GodSDKPush;)V
    .locals 0

    .prologue
    .line 28
    iput-object p1, p0, Lcom/boyaa/godsdk/core/GodSDKPush$Action;->this$0:Lcom/boyaa/godsdk/core/GodSDKPush;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
