part of 'network_cubit.dart';

abstract class NetworkState {}

class NetworkInitial extends NetworkState {}

class NetworkConnectedState extends NetworkState {}

class NetworkLostState extends NetworkState {}
